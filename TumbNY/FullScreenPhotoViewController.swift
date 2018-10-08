//
//  FullScreenPhotoViewController.swift
//  TumbNY
//
//  Created by Bhavesh Shah on 10/8/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backDropImageView: UIImageView!
    
    var post: [String: Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate=self
        
        if let photos = post!["photos"] as? [[String: Any]] {
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            backDropImageView.af_setImage(withURL: url!)
        }
       
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.contentSize = backDropImageView.image!.size
        
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return backDropImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
