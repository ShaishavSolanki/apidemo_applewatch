//
//  ChangeCityInterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by MacStudent on 2019-03-05.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation


class ChangeCityInterfaceController: WKInterfaceController {

    @IBOutlet var selectCityButton: WKInterfaceButton!
    
    @IBOutlet var cityLabel: WKInterfaceLabel!
    @IBOutlet var saveButton: WKInterfaceButton!
    
    var cityName: String?
    
    
    
    @IBAction func selectCityButtonAction() {
    
    
        let suggestedCity = ["Toronto", "Montreal", "New York City"]
        
        presentTextInputController(withSuggestions: suggestedCity, allowedInputMode: .plain) {
            
            (results) in
            if (results != nil && results!.count > 0) {
                
                
                
                let userResponse  = results?.first as? String
                self.cityLabel.setText(userResponse)
                
                self.cityName = userResponse
            }
        
        }
        
    }
    @IBAction func saveButtonAction() {
        
        let sharedPreferences = UserDefaults.standard
        
        sharedPreferences.set(self.cityName, forKey: "city")
    
        
        self.popToRootController()
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
