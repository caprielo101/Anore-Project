//
//  PageOneViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    
    @IBOutlet weak var warmUpImageView: UIImageView!
    
    var warmUpImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warmUpImageView.layer.borderColor = UIColor.textColor.cgColor
        warmUpImageView.layer.borderWidth = 5
        warmUpImageView.contentMode = .scaleAspectFill
        
        warmUpImages = createImageArray(total: 6, prefix: "warmup")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animate(imageView: warmUpImageView, images: warmUpImages, duration: 5)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        warmUpImageView.stopAnimating()
    }
}
