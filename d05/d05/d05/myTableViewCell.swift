//
//  myTableViewCell.swift
//  d05
//
//  Created by Olivier SENG on 6/19/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit
import CoreLocation

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    var locs : (String, String, CLLocationCoordinate2D)?
    {
        didSet
        {
            if let p = locs
            {
                title.text = p.0
                detail.text = p.1
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
