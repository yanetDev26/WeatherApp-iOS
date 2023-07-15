//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Yanet Rodriguez on 14/07/2023.
//

import Foundation
import CoreLocation

class WeatherManager {
    let apiKey = "c7238e78ee0601bfdd7da921277083c3"

    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)

        return decodedData
    }
}
