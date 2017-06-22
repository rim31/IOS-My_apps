//
//  ViewController.swift
//  Death Note
//
//  Created by OS on 6/14/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
    @IBOutlet weak var tableView: UITableView!

    @IBAction func unwindSegueDone(segue: UIStoryboardSegue) {
        print("coucou")
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? myTableViewCell
        
        
        
        cell?.titre.text = Data.tab[indexPath.row]["name"]
        cell?.dateDeath.text = Data.tab[indexPath.row]["deathDate"]
        cell?.descr.text = Data.tab[indexPath.row]["desc"]

        
        
        return cell!
    }
}

