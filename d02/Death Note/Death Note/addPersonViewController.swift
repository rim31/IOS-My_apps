//
//  addPersonViewController.swift
//  Death Note
//
//  Created by OS on 6/15/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

//on

class addPersonViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateDeath: UIDatePicker!
    @IBOutlet weak var descr: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //on creer le boutton perfornmSegue pour pouvoir revoyer le retour
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
      performSegue(withIdentifier: "unwindDoneSegue", sender: self)
    }
    
    //on fait la fonction prepare pour appliquer les changement dans la vue precedent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueDone"
        {
            if let vc = segue.destination as? ViewController
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
                let strDate = dateFormatter.string(from: dateDeath.date)
                //on insert dans le tableau precedent avec les data precedement entrees
                if ((name?.text) != "") {
                    Data.tab.insert(["name" : (name?.text)!, "deathDate" : strDate, "desc" : descr!.text], at: 0)
                    vc.tableView.reloadData()
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
