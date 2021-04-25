//
//  PageTwoViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {

    @IBOutlet weak var singalongImageView: UIImageView!
    
    var singalongImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        singalongImageView.layer.borderColor = UIColor.textColor.cgColor
        singalongImageView.layer.borderWidth = 5
        singalongImageView.contentMode = .scaleAspectFill
        
        singalongImages = createImageArray(total: 8, prefix: "sing")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animate(imageView: singalongImageView, images: singalongImages, duration: 7)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        singalongImageView.stopAnimating()
    }
}
