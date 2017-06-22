//
//  ViewController.swift
//  rush00
//
//  Created by Thomas LE MEUR on 6/17/17.
//  Copyright © 2017 Thomas LE MEUR. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    //static var API : ApiController!
    static var topic : Topic!
    static var it: ThirdViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThirdViewController.it = self
        //ThirdViewController.API = ApiController()
        SecondViewController.API.loadAllMessages(fromTopicId: ThirdViewController.topic.id)
        //ThirdViewController.API.getAppToken()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
