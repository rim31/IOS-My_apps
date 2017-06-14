//
//  ImageViewController.swift
//  d03
//
//  Created by Sergio VELHINHO on 6/14/17.
//  Copyright © 2017 Sergio VELHINHO. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageView : UIImageView?

    @IBOutlet weak var imageScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageScrollView.addSubview(imageView!)
        imageScrollView.contentSize = (imageView?.frame.size)!
        imageScrollView.maximumZoomScale = 100
        imageScrollView.minimumZoomScale = 0.3
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
