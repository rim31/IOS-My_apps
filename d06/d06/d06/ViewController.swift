//
//  ViewController.swift
//  d06
//
//  Created by Olivier SENG on 6/20/17.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit
import CoreMotion



class ViewController: UIViewController {
        static let gravity = UIGravityBehavior()            //gravite
        let dynamicItem = UIDynamicItemBehavior()           //elasticite
        static var dynamicAnimator : UIDynamicAnimator?     //toutes les animations
        var objets : [Form]?
        var collision = UICollisionBehavior()               //ajout de la collision
        var shape: UIView!
        var snap: UISnapBehavior!
        //=================================
        var panGesture = UIPanGestureRecognizer()
        var pinchGesture = UIPinchGestureRecognizer()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ajout de la gravite
        ViewController.dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        //ajout de la collision
        collision.translatesReferenceBoundsIntoBoundary = true
        ViewController.dynamicAnimator?.addBehavior(collision)
        
        //ajout de la gravite
        ViewController.gravity.magnitude = 3
        ViewController.dynamicAnimator?.addBehavior(ViewController.gravity)
        
        //ajout de l'elasticite
        dynamicItem.elasticity = 0.6
        ViewController.dynamicAnimator?.addBehavior(dynamicItem)
        
        //drag & drop
//        panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewDidDragged))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   



    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let myCoord = sender.location(in: view)     // on recupere les coordonee
        
        let new_square = Form(coord: myCoord)       // on cree un objet avec la class Form suivant les coordonnees du clic
        shape = new_square                          // on affecte une View
        objets?.append(new_square)                  // on met les objets dans un tableau []
        
        view.addSubview(new_square)                 // on met l'objet dans la view

        collision.addItem(new_square)               // on applique la collision
        ViewController.gravity.addItem(new_square)                 // on applique la gravite
        dynamicItem.addItem(new_square)
//        new_square.setUpGesture()

    }
    
}
