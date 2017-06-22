//
//  ImgViewController.swift
//  lop
//
//  Created by Olivier SENG on 6/16/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ImgViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        image = UIImage(named: "42")
//        imageView = UIImageView(image: image)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
