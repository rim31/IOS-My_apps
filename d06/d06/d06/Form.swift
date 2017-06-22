//
//  Form.swift
//  d06
//
//  Created by Olivier SENG on 6/21/17.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

func randomColor() -> UIColor {
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}


class Form : UIView {
    var isCircle = false
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if isCircle
        {
            return .ellipse
        }
        return .rectangle
    }
    
    init(coord : CGPoint) {
        super.init(frame: CGRect(x: coord.x - 50, y: coord.y - 50, width: 100, height: 100))
        self.backgroundColor = randomColor()
        if arc4random_uniform(9) > 4 {
//            self.layer.cornerRadius = 50 // ou
            self.layer.cornerRadius = self.frame.size.width/2
            isCircle = true
        }
        setUpGesture()
    }
    //=============pan gesture============
    let panGesture = UIPanGestureRecognizer()
    var firstX: CGFloat?
    var firstY: CGFloat?
    
    func setUpGesture() {//on ajoute la fonction drag
        panGesture.addTarget(self, action: #selector(panGestureChanged(_:)))
        self.addGestureRecognizer(panGesture)
    }


    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }


    //============fonction du drag=============
    func panGestureChanged (_ dragGesture :UIPanGestureRecognizer) {

        bringSubview(toFront: self)
        let locationInSuperView = panGesture.translation(in: self.superview)
        
        switch dragGesture.state {
        case .began:
            firstX = self.center.x
            firstY = self.center.y
            ViewController.gravity.removeItem(self) // on retire la gravite pdt le deplacement
        case .changed:
            self.center.x = firstX!+locationInSuperView.x
            self.center.y = firstY!+locationInSuperView.y
            ViewController.dynamicAnimator?.updateItem(usingCurrentState: self) // on actualise la place
        case .ended:
            ViewController.gravity.addItem(self) // on remet la gravite
            ViewController.dynamicAnimator?.updateItem(usingCurrentState: self) // on reaffecter les animations
        default:
            break
        }
    }
}
