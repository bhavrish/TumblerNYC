//
//  PhotoDetailsViewController.swift
//  TumbNY
//
//  Created by Bhavesh Shah on 10/8/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "zoom", sender: nil)

    }
    
    var post: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let post = post {
            dateLabel.text = post["date"] as? String
            summaryLabel.text = post["caption"] as? String
            
            // Setting the link for backDrop image.
            if let photos = post["photos"] as? [[String: Any]] {
                let photo = photos[0]
                let originalSize = photo["original_size"] as! [String: Any]
                let urlString = originalSize["url"] as! String
                let url = URL(string: urlString)
                backDropImageView.af_setImage(withURL: url!)
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
