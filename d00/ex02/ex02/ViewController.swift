//
//  ViewController.swift
//  ex02
//
//  Created by OS on 6/12/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func numbers(_ sender: UIButton)
    {
        resultLabel.text = resultLabel.text! + String(sender.tag-1)
        print("boutton : ", sender.tag-1)
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

