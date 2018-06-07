//
//  CollectionViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/6/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit
import Apollo
import Kingfisher



class Cell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
}

class CollectionViewController: UICollectionViewController {
    
    var icons: [IconDetails]! {
        didSet {
            collectionView!.reloadData()
        }
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"space")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundView = imageView
        apollo.fetch(query: IconsQuery(name: "cannabis")) { [weak self] result, error in
            guard let icons = result?.data?.searchNounProj else { return }
            self?.icons = icons.map { ($0?.fragments.iconDetails)! }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let icons = self.icons else { return 0}
        return icons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath) as! Cell
    
        guard let icons = self.icons else { return UICollectionViewCell() }
        let iconDetails = icons[indexPath.row]
        var url = URL(string: "https://d30y9cdsu7xlg0.cloudfront.net/png/137356-84.png")!
        if (iconDetails.previewUrl != nil) {
            url = URL(string: (iconDetails.previewUrl)!)!
        }
        let resource = ImageResource(downloadURL: url)
        let imageView = UIImageView(image: UIImage(named: iconDetails.previewUrl_84!))
        imageView.setImageColor(color: UIColor.purple)
        let image = UIImage(named: "Polygon")
        cell.iconImage.kf.setImage(with: resource, placeholder: image)
        
    
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
