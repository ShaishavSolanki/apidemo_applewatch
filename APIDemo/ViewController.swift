//
//  ViewController.swift
//  APIDemo
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON           // import this to process your JSON response

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let URL = "https://api.sunrise-sunset.org/json?lat=49.2827&lng=-123.1207&date=today"
        
        Alamofire.request(URL).responseJSON {
            // 1. store the data from the internet in the
            // response variable
            response in
            
            // 2. get the data out of the variable
            guard let apiData = response.result.value else {
                print("Error getting data from the URL")
                return
            }
        
            // OUTPUT the json response to the terminal
            print(apiData)
            
            
            // GET something out of the JSON response
            let jsonResponse = JSON(apiData)
            let sunriseTime = jsonResponse["results"]["sunrise"].string
            let sunsetTime = jsonResponse["results"]["sunset"].string
            
            print("Sunrise: \(sunriseTime)")
            print("Sunset: \(sunsetTime)")
            
            // show the sunrise and sunset in the IPhone App
            self.sunsetTimeLabel.text = "\(sunriseTime!)"
            self.sunriseTimeLabel.text = "\(sunsetTime!)"
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

