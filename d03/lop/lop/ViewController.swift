//
//  ViewController.swift
//  lop
//
//  Created by Olivier SENG on 6/16/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imgSegue" {
            if let destinationView = segue.destination as? ImgViewController  {
                let cell = sender as! MyCollectionViewCell
                destinationView.image = cell.imageView.image
            }
        }
    }
    
    let reuseIdentifier = "cell" // identifier de la cellule immage
    var items = ["https://s-media-cache-ak0.pinimg.com/originals/a3/b0/ac/a3b0acc7fd85878fa4f69367a8be354f.jpg", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/dbbpp4vxoae-z42.jpg", "https://www.nasa.gov/sites/default/files/thumbnails/image/agn_fnl_lcook-1.jpg", "https://assets.letemps.ch/sites/default/files/media/2017/06/03/file6v66p10odvl1d0g2r93z.jpg"]// les immages
    
    
    func showAlert(_ msg: String)// fonction show alert
    {
        let Alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)//titre
        let Action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)//bouton
        Alert.addAction(Action)//on affecte el bouton au titre
        self.present(Alert, animated: true, completion: nil)//on appelle la fonction
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueImg", sender: collectionView.cellForItem(at: indexPath))
    }
    
    
    // On compte le nombre d'image pour la collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return items.count
    }
    
    // Chemin de chaque celle d'image
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        // comme l'exo d03, on caste
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell

        // fomme dans la video de queue
        let qos = DispatchQoS.default.qosClass
        let queue = DispatchQueue.global(qos: qos)
        
        // asynchronisation
        queue.async {
            DispatchQueue.main.async {//on affiche les image que dns le main
                self.mySwitchNetworkActivityMonitor()
            }
            if let url = NSURL(string: self.items[indexPath.item])
            {
                if let data = NSData(contentsOf: url as URL) {
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(data: data as Data)//on affecte l'image a la cellule
                    }
                }
                else
                {
                    self.showAlert("Fail to load " + self.items[indexPath.item])//on utilise la fonction alert
                }
            }
            else
            {
                self.showAlert("Fail to load " + self.items[indexPath.item])
            }
            DispatchQueue.main.async {
                cell.activityMonitor.stopAnimating()
                self.mySwitchNetworkActivityMonitor()
            }
        }

        return cell
    }

    func mySwitchNetworkActivityMonitor()
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

}

