//
//  ViewModel.swift
//  MVVM
//
//  Created by Chitaranjan Sahu on 10/07/17.
//  Copyright © 2017 me.in. All rights reserved.
//

import Foundation
import UIKit


class ViewModel{

   var weatherData: ModelData
    
    var rawUnixTime: Double?
    var minTemp: Int?
    var maxTemp: Int?
    var summary: String?
    var dateString: String = ""
     let reuseIdentifier = "WeatherCell"
    init(_ weatherData: ModelData) {
        
        self.weatherData = weatherData
        rawUnixTime = weatherData.rawUnixTime
        minTemp = Int(weatherData.minTemp.rounded())
        maxTemp = Int(weatherData.maxTemp.rounded())
        summary = weatherData.summary
        
        guard let unixTime = rawUnixTime else {
            print("Invalid unix time")
            return
        }
        
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateString = dateFormatter.string(from: date)

    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! WetherTableViewCell
        cell.setUp(self)
        return cell
    }
    
    
    
    
}
