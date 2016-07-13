//
//  ViewController.swift
//  Hello_wolrd
//
//  Created by Rim S on 13/07/2016.
//  Copyright © 2016 Rim S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HelloWorld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HelloWorld.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ShowHide(sender: AnyObject) {
        HelloWorld.hidden = !HelloWorld.hidden
    }


}

