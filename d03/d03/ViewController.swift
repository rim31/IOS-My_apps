//
//  ViewController.swift
//  d03
//
//  Created by Sergio VELHINHO on 6/14/17.
//  Copyright © 2017 Sergio VELHINHO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["https://www.nasa.gov/sites/default/files/thumbnails/image/agn_fnl_lcook-1.jpg", "https://apod.nasa.gov/apod/image/1706/m89_hanson_3866.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/dbbpp4vxoae-z42.jpg?itok=8ImKvuT0", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/32894787863_81394822de_o.jpg?itok=6TB_Trlm"]
    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func switchNetworkActivityMonitor()
    {
        if UIApplication.shared.isNetworkActivityIndicatorVisible
        {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        else
        {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    
    func showAlert(msg : String)
    {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        let qos = DispatchQoS.default.qosClass
        
        let queue = DispatchQueue.global(qos: qos)
        
        queue.async {
            self.switchNetworkActivityMonitor()
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            if let url = NSURL(string: self.items[indexPath.item])
            {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
                else
                {
                    self.showAlert(msg: "Cannot access to " + self.items[indexPath.item])
                }
            }
            else
            {
                self.showAlert(msg: "Cannot access to " + self.items[indexPath.item])
            }

            cell.activityMonitor.stopAnimating()
            cell.activityMonitor.isHidden = true
            self.switchNetworkActivityMonitor()
        }
        
        return cell
    }
}
