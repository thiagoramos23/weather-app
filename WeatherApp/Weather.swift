//
//  Weather.swift
//  WeatherApp
//
//  Created by Thiago Ramos on 21/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let the_temp: Float
    let min_temp: Float
    let max_temp: Float
        
    func mainTemperature() -> String {
        let temp = format(number: self.the_temp)
        return temp + "˚C"
    }
    
    func minTemperature() -> String {
        let temp = format(number: self.min_temp)
        return temp + "˚C"
    }

    func maxTemperature() -> String {
        let temp = format(number: self.max_temp)
        return temp + "˚C"
    }

    private func format(number: Float) -> String {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = false
        return formatter.string(from: NSNumber(value: number))!
    }
}
