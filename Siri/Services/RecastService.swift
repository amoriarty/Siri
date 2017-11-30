//
//  RecastService.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import Foundation
import RecastAI

class RecastService {
    static let shared = RecastService()
    private let bot = RecastAIClient(token: RECAST_TOKEN)
    
    func getLocation(for question: String, completion: @escaping (Location?, Error?) -> Void) {
        bot.textRequest(question, successHandler: { response in
            guard let location = response.get(entity: "location") else {
                DispatchQueue.main.async { completion(nil, nil) }
                return
            }
            
            guard let latitude = location["lat"] as? Double else { return }
            guard let longitude = location["lng"] as? Double else { return }
            guard let raw = location["raw"] as? String else { return }
            
            DispatchQueue.main.async {
                completion(Location(latitude: latitude, longitude: longitude, raw: raw), nil)
            }
        }) { error in
            DispatchQueue.main.async { completion(nil, error) }
        }
    }
    
    func send(message: String, completion: @escaping (String?, Error?) -> Void) {
        bot.textConverse(message, successHandler: { response in
            guard let entities = response.entities else { return }
            guard let intents = response.intents else { return }
            guard let replies = response.replies else { return }
            guard let language = response.language else { return }
            
            print("\n\n")
            print(entities)
            print(intents)
            print(replies)
            print(language)
        }) { error in
            DispatchQueue.main.async { completion(nil, error) }
        }
    }
}
