//
//  NetworkManager.swift
//  MVVM
//
//  Created by Chitaranjan Sahu on 10/07/17.
//  Copyright © 2017 me.in. All rights reserved.
//

import Foundation


class NetworkManager{
    let baseURLString: String = "https://api.darksky.net/forecast/"
    var baseURLWithAPIKeyString: String
    
    init(_ url:String) {
        self.baseURLWithAPIKeyString = "\(self.baseURLString)\(url)/"
    }
    var weatherDataArray: [ModelData] = []

    
    func getWeatherForCoordinate(coordinate:String,compilationHandler: @escaping (_ data:[ModelData]?,_ error:NSError?) -> Void )
    {
        let requestURL: String = "\(baseURLWithAPIKeyString)\(coordinate)"
        
        var request = URLRequest(url: URL(string: requestURL)!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        
        

        let task = URLSession.shared.dataTask(with: request) { (data:Data?, responce:URLResponse?, error:Error?) in
            
            if let response = responce {
                
                
                do {
                    
                    guard let todo = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        as? [String: AnyObject] else {
                            print("error trying to convert data to JSON")
                            return
                    }
                    
                    guard let data  = todo["daily"] as? [String:Any], let jsonData  = data["data"] as? [[String:Any]] else{
                        print("error trying to convert data to JSON")
                        return
                    }
                    
                    
                    print("JSON\(jsonData)")
                    
                    
                    for day in jsonData {
                
                        guard let rawUnixTime = day["time"] as? Double,
                            let minTemp = day["temperatureMin"] as? Double,
                            let maxTemp = day["temperatureMax"] as? Double,
                            let summary = day["summary"] as? String else {
                                print("Error with data")
                                return
                        }
                        let weatherData = ModelData(rawUnixTime: rawUnixTime, minTemp: minTemp, maxTemp: maxTemp, summary: summary)
                        self.weatherDataArray.append(weatherData)
                    }
                    
                    
                    compilationHandler(self.weatherDataArray,nil)
                   // return weatherDataArray
                    
                    
                } catch  {
                    print("error trying to convert data to JSON\(error)")
                    return
                }
                
                
                print(response)
            }
            if let error = error {
                print(error)
            }
        }
        task.resume()
        
        
    }
    
}
