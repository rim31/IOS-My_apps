//
//  topicsTableViewCell.swift
//  myForum
//
//  Created by Olivier SENG on 6/17/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class topicsTableViewCell: UITableViewCell {

    @IBOutlet weak var auteur: UILabel!
    @IBOutlet weak var dateTopic: UILabel!
    @IBOutlet weak var titreTopic: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var topic : [String : String]? {
        didSet {
            if let n = topic {
                auteur?.text = n["login"]
                dateTopic?.text = n["date"]
                titreTopic?.text = n["title"]
                if let url = NSURL(string: n["image"]!)
                {
                    if let data = NSData(contentsOf: url as URL)
                    {
                        photo.image = UIImage(data: data as Data)
                    }
                }
            }
        }
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
