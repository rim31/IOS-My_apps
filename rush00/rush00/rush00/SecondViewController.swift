//
//  ViewController.swift
//  rush00
//
//  Created by Thomas LE MEUR on 6/17/17.
//  Copyright © 2017 Thomas LE MEUR. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var API : ApiController!
    static var it: SecondViewController!
    
    @IBOutlet weak var myTableView: UITableView!
    var list: [(Int, String, String, String)]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list = []
        SecondViewController.it = self
        SecondViewController.API = ViewController.API
        SecondViewController.API.loadAllTopics()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segueToMsg(_ sender: Any) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "messages", sender: "batman")
        }
    }
    
//    func calculateHeight(inString : String) -> CGFloat {
//        let attributes : [String : Any] = [NSFontAttributeName : UIFont.systemFont(ofSize: 17.0)]
//        let attributedString : NSAttributedString = NSAttributedString(string: inString, attributes: attributes)
//        let rect : CGRect = attributedString.boundingRect(with: CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
//        return rect.height
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let heightOfRow = self.calculateHeight(inString: Topic.allTopics[indexPath.row].content)
//        return (heightOfRow + 40.0)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Topic.allTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell") as! TopicCell
        cell.node = Topic.allTopics[indexPath.row]
        return cell
    }
    
}
