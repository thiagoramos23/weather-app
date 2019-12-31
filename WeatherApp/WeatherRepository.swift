//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Thiago Ramos on 21/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

enum Error: Swift.Error {
    case requestFailed
}

class WeatherRepository {
    
    func getWeather(completionHandler: @escaping ([Weather]) -> Void) {
        let components = URLComponents(string: "https://www.metaweather.com/api/location/455827")!
        let request = URLRequest(url: components.url!, cachePolicy: .reloadRevalidatingCacheData)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data,
                    let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode,
                    error == nil else {
                    throw error ?? Error.requestFailed
                }
                let consolidated = try JSONDecoder().decode(ConsolidatedWeather.self, from: data)
                print(consolidated)
                completionHandler(consolidated.consolidated_weather)
            } catch {
                print("Error getting the weather: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
    }
}

struct ConsolidatedWeather: Decodable {
    var consolidated_weather: [Weather]
}
