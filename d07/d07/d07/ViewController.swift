//
//  ViewController.swift
//  d07
//
//  Created by Olivier SENG on 6/22/17.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {
    var clic: Bool = false

    var bot : RecastAIClient?
    let client = DarkSkyClient(apiKey: "302c7314286507afd0a13079b4c34716")


    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token : "cb1b1cd85f6392d849f2fe421c7a047c")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func successHandler(response : Response) {
//        print(response.intent)
//        print(response.attention)
        print(response)
        let location = response.get(entity: "location")
        if (location != nil) {
        lopette(location?["lat"] as! Double, location?["lng"] as! Double)
        }
        else {
            print("Error")
            self.responseLabel?.text = "Error"
        }
//        print(response.entities.[location[lat]])
        clic = false
    }
    
    
    
    func failureHandler(error : Error) {
        print(error)
        print("Error")
        self.responseLabel?.text = "Error"
        clic = false
    }
    
    
    @IBOutlet weak var questionLabel: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var questionField: UITextField!
    
    /**
     Make text request to Recast.AI API
     */
    @IBAction func makeRequest(_ sender: UIButton) {
        if !clic
        {
            clic = true
            //Call makeRequest with string parameter to make a text request
            if questionLabel.text! ==  "" {
                questionLabel.text! = "Error"
                clic = false
            }
            else
            {
                self.bot?.textRequest(questionLabel.text!, successHandler: successHandler(response: ), failureHandle: failureHandler(error: ))
                questionField.text = ""

            }
        }
    }

    func lopette(_ lat : Double, _ lng : Double)  {
        client.getForecast(latitude: lat, longitude: lng) {
            result in
            switch result {
            case .success(let currentForecast, let requestMetadata):
                self.responseLabel?.text = currentForecast.daily?.summary
                print(requestMetadata)
            //  We got the current forecast!
            case .failure(let error):
                //  Uh-oh. We have an error!
                print(error)
            }
        }    }

    
//    token darksky : 302c7314286507afd0a13079b4c34716
//    https://api.darksky.net/forecast/302c7314286507afd0a13079b4c34716/37.8267,-122.4233
    
}

