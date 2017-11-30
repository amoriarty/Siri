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
            DispatchQueue.main.async {
                completion(Location(latitude: latitude, longitude: longitude), nil)
            }
        }) { error in
            DispatchQueue.main.async { completion(nil, error) }
        }
    }
}
