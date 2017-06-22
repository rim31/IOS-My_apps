//
//  topicCell.swift
//  rush00
//
//  Created by Julian SCARPONE on 6/17/17.
//  Copyright © 2017 Thomas LE MEUR. All rights reserved.
//
import UIKit

class TopicCell: UITableViewCell {
    
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var topicContent: UITextView!
    @IBOutlet weak var topicAuthor: UILabel!
    @IBOutlet weak var topicDate: UILabel!
    @IBOutlet weak var topicImage: UIImageView!
    
    var node: Topic? {
        didSet {
            if let n = node {
                topicName.text = n.name
                topicContent.text = n.content.replacingOccurrences(of: "\r", with: "")
                topicAuthor.text = n.authorLogin
                topicDate.text = n.date
                if let url = NSURL(string: "https://cdn.intra.42.fr/users/medium_\(n.authorLogin).jpg")
                {
                    if let data = NSData(contentsOf: url as URL)
                    {
                        topicImage.image = UIImage(data: data as Data)
                    }
                }
            }
        }
    }
    
}
