//
//  ModelData.swift
//  MVVM
//
//  Created by Chitaranjan Sahu on 10/07/17.
//  Copyright © 2017 me.in. All rights reserved.
//

import Foundation


class ModelData :NSObject {
    var rawUnixTime: Double
    var minTemp: Double
    var maxTemp: Double
    var summary: String
    
    init(rawUnixTime: Double, minTemp: Double, maxTemp: Double, summary: String) {
        self.rawUnixTime = rawUnixTime
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.summary = summary
    }


    
}
