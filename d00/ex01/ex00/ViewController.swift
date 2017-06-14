//
//  ViewController.swift
//  ex00
//
//  Created by OS on 6/12/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!

    
    @IBAction func clickButton(_ sender: UIButton) {
        print("Hello World !")
        helloLabel.text = "Hello World !"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

