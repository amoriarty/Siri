//
//  DarkSpyService.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import Foundation
import ForecastIO

class DarkSkyService {
    static let shared = DarkSkyService()
    private let client = DarkSkyClient(apiKey: DARKSKY_KEY)
    
    func getSummary(for location: Location, completion: @escaping (String?, Error?) -> Void) {
        client.getForecast(latitude: location.latitude, longitude: location.longitude, completion: { result in
            switch result {
            case .success(let forecast, _): DispatchQueue.main.async { completion(forecast.currently?.summary, nil) }
            case .failure(let error): DispatchQueue.main.async { completion(nil, error) }
            }
        })
    }
}
