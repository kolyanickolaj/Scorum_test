//
//  WeatherManager.swift
//  Scorum_test
//
//  Created by Администратор on 27.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation

class WeatherManager {
    
    static let shared = WeatherManager()
    var description = ""
    
    func fetchWeather(completion: @escaping (_ weather:Weather) -> ())  {
        let latitude = LocationManager.shared.fetchedLatitude
        let longitude = LocationManager.shared.FetchedLongitude

        let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
        let openWeatherMapAPIKey = "06db44f389d2172e9b1096cdce7b051c"
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&lat=\(latitude)&lon=\(longitude)")!

        let request = URLRequest(url:weatherRequestURL as URL)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let networkError = error {
                print(networkError.localizedDescription)
            }
            else {
                do {
                    let weatherData = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]

                    let weather = Weather(weatherData: weatherData)
                    NotificationCenter.default.post(name: Notification.Name("WeatherFetched"), object: nil)
                    
                    DispatchQueue.main.async {
                        completion(weather)
                    }
                }
                catch let jsonError as NSError {
                    print(jsonError.description)
                }
            }
        }
        dataTask.resume()
    }
}


