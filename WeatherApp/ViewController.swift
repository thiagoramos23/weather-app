//
//  ViewController.swift
//  WeatherApp
//
//  Created by Thiago Ramos on 21/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getWeather()
    }

    private func getWeather() {
        WeatherRepository().getWeather { (weathers) in
            let todayWeather = weathers[0]
            DispatchQueue.main.async {
                self.mainTemperature.text = todayWeather.mainTemperature()
                self.minTemperature.text  = "Min: " + todayWeather.minTemperature()
                self.maxTemperature.text  = "Max: " + todayWeather.maxTemperature()
            }
        }
    }

}

