//
//  ThridViewController.swift
//  d05
//
//  Created by R S on 03/07/2017.
//  Copyright © 2017 OS. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Int = 0
    var previousNumber:Int = 0
    var operatorPressed = false
    var operation = 0
    var divnull = false
    var equalPressed = false
    var stillnotequal = false
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //insertion des nombre via les tag (tag = nb +1)
    @IBAction func numbers(_ sender: UIButton)
    {
        equalPressed = false
        if ( divnull == true)
        {
            divnull = false
        }
        if (operatorPressed == true)//je stocke l'operateur
        {
            resultLabel.text = String(sender.tag-1)
            numberOnScreen = Int(resultLabel.text!)!
            operatorPressed = false
        }
        else
        {
            if (resultLabel.text == "error NaN")
            {
                resultLabel.text = ""
            }
            else  if (resultLabel.text == "" || resultLabel.text == "0")
            {
                if (resultLabel.text!.characters.count < 12)
                {
                    resultLabel.text = String(sender.tag-1)
                }
            }
            else if (operatorPressed == false)
            {
                if (resultLabel.text!.characters.count < 12)
                {
                    resultLabel.text = resultLabel.text! + String(sender.tag-1)
                }
                print(resultLabel.text!.characters.count)
            }
            numberOnScreen = Int(resultLabel.text!)!
            //                print("result operation = ", numberOnScreen.characters.count + Int(sender.tag-1))
            
        }
        
    }
    
    
    
    
    //operation : AC:11 NEG:12 +:13 *:14 -:15 /:16 =:17
    @IBAction func boutton(_ sender: UIButton)
    {
        if (resultLabel.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17)
        {
            equalPressed = false
            if (divnull == true)
            {
                numberOnScreen = 0
                previousNumber = 0
                operation = 0
                operatorPressed = false
                resultLabel.text = ""
            }
            else
            {
                if (operatorPressed == false && !stillnotequal)
                {
                    previousNumber = Int(resultLabel.text!)!
                }
            }
            if (sender.tag == 13)       // somme
            {
                resultLabel.text = "+"
                if (stillnotequal == true)
                {
                    previousNumber = previousNumber + numberOnScreen
                }
                else
                {
                    stillnotequal = true
                }
            }
            else if (sender.tag == 14)  // multiplie
            {
                resultLabel.text = "x"
                if (stillnotequal == true)
                {
                    previousNumber = previousNumber * numberOnScreen
                }
                else
                {
                    stillnotequal = true
                }
            }
            else if (sender.tag == 15)  //  moins
            {
                resultLabel.text = "-"
                if (stillnotequal == true)
                {
                    previousNumber = previousNumber - numberOnScreen
                }
                else
                {
                    stillnotequal = true
                }
            }
            else if (sender.tag == 16)  //  divise
            {
                resultLabel.text = "÷"
                if (stillnotequal == true)
                {
                    if (numberOnScreen != 0)
                    {
                        previousNumber = previousNumber / numberOnScreen
                    }
                }
                else
                {
                    stillnotequal = true
                }
            }
            operation = sender.tag
            operatorPressed = true
        }
        else if (sender.tag == 17 && equalPressed != true)
        {
            stillnotequal = false
            if (operation == 13)
            {
                resultLabel.text = String(previousNumber + numberOnScreen)
                numberOnScreen = previousNumber + numberOnScreen
                numberOnScreen = 0
                previousNumber = 0
                operatorPressed = false
                
            }
            else if (operation == 14)
            {
                resultLabel.text = String(previousNumber * numberOnScreen)
                numberOnScreen = previousNumber * numberOnScreen
                numberOnScreen = 0
                previousNumber = 0
                operatorPressed = false
            }
            else if (operation == 15)
            {
                resultLabel.text = String(previousNumber - numberOnScreen)
                numberOnScreen = previousNumber - numberOnScreen
                numberOnScreen = 0
                previousNumber = 0
                operatorPressed = false            }
            else if (operation == 16)
            {
                if (numberOnScreen == 0)
                {
                    divnull = true
                    resultLabel.text = "error NaN"
                    numberOnScreen = 0
                    previousNumber = 0
                    operation = 0
                    operatorPressed = false
                }
                else
                {
                    resultLabel.text = String(previousNumber / numberOnScreen)
                    numberOnScreen = previousNumber / numberOnScreen
                    numberOnScreen = 0
                    previousNumber = 0
                    operatorPressed = false
                }
            }
            equalPressed = true
        }
        else if (sender.tag == 11)
        {
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            operatorPressed = false
            resultLabel.text = ""
        }
        else if (sender.tag == 12)
        {
            if (numberOnScreen != 0)
            {
                numberOnScreen *= -1
                resultLabel.text = String(numberOnScreen)
            }
        }
        
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

