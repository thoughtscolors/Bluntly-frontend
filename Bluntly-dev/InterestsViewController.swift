//
//  InterestsViewController.swift
//  Bluntly-dev
//
//  Created by Apple on 6/4/18.
//  Copyright © 2018 MEEU. All rights reserved.
//

import UIKit
import Apollo
import Kingfisher

class InterestsViewController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    
    @IBOutlet weak var searchField: UITextField!
    
    var icons: [IconDetails]! {
        didSet {
            updateUI()
        }
    }
    
    var imageIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.addPadding(.left(15))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeSearchBackground () {
        let image = #imageLiteral(resourceName: "SearchBarSelected")
        searchField.background = image
    }
    
    @IBAction func search () {
        let name = searchField.text
        apollo.fetch(query: IconsQuery(name: name!)) { [weak self] result, error in
            guard let icons = result?.data?.searchNounProj else { return }
            self?.icons = icons.map { ($0?.fragments.iconDetails)! }
        }
        self.imageIndex += 1
        updateUI()
    }
    
    func updateUI() {
        let icons = self.icons
        let iconDetails = icons?[0]
        var url = URL(string: "https://d30y9cdsu7xlg0.cloudfront.net/png/137356-84.png")!
        if (iconDetails?.previewUrl_84 != nil) {
            url = URL(string: (iconDetails?.previewUrl_84)!)!
        }
        let resource = ImageResource(downloadURL: url)
        let image = UIImage(named: "Polygon")
        let imageIndex = self.imageIndex
        switch imageIndex {
            case 1:
            imageView1.kf.setImage(with: resource, placeholder: image)
            case 2:
            imageView2.kf.setImage(with: resource, placeholder: image)
            case 3:
            imageView3.kf.setImage(with: resource, placeholder: image)
            case 4:
            imageView4.kf.setImage(with: resource, placeholder: image)
            case 5:
            imageView5.kf.setImage(with: resource, placeholder: image)
            case 6:
            imageView6.kf.setImage(with: resource, placeholder: image)
            case 7:
            imageView7.kf.setImage(with: resource, placeholder: image)
            case 8:
            imageView8.kf.setImage(with: resource, placeholder: image)
            case 9:
            imageView9.kf.setImage(with: resource, placeholder: image)
        default:
            return
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

extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}




    


