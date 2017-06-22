//
//  ViewController.swift
//  myForum
//
//  Created by OS on 6/17/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var API: ApiController?
    static var it: ViewController? //singleton : via la classe , tout est accessible
    
    @IBOutlet weak var allTopicsTableview: UITableView!
    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    @IBOutlet weak var topicsForumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.it = self
        if ViewController.API != nil {
            ViewController.API = ApiController()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donnees.myInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTopic", for: indexPath) as? topicsTableViewCell
        
        
        //je recupere les donne du model : nom, titre, date, image
//        cell?.auteur.text = donnees.myInfos[indexPath.row]["login"]
//        cell?.dateTopic.text = donnees.myInfos[indexPath.row]["date"]
//        cell?.titreTopic.text = donnees.myInfos[indexPath.row]["title"]
        //affichage du de la photo
//        if let url = NSURL(string: donnees.myInfos[indexPath.row]["image"]!)
//        {
//            if let data = NSData(contentsOf: url as URL) {
//                cell?.photo.image = UIImage(data: data as Data)//on affecte l'image a la cellule
//            }
//        }
        
        //==================facon elegante===============
        cell?.topic = donnees.myInfos[indexPath.row] // pour metre directement dans le didSet

        
        
        //on arrondit le images ;-)
        cell?.photo.layer.cornerRadius = 10
        cell?.photo.layer.borderWidth = 3
        cell?.photo.layer.borderColor = UIColor.red.cgColor;
        cell?.photo.clipsToBounds = true
        return cell!
     }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //dode pour resize a la bonne taille le contenue des cellules
    }
    
}
