//
//  ModelData.swift
//  WeatherApp
//
//  Created by Yanet Rodriguez on 14/07/2023.
//

import Foundation

var previewWeather: ResponseBody = load("weatherBuenosAiresData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't fine \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle.")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle.")
    }
}
