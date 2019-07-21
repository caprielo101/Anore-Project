//
//  PageThreeViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class PageThreeViewController: UIViewController {

    @IBOutlet weak var yourProgressImageView: UIImageView!
    
    var yourProgressImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourProgressImageView.layer.borderColor = UIColor.textColor.cgColor
        yourProgressImageView.layer.borderWidth = 5
        yourProgressImageView.contentMode = .scaleAspectFill
        yourProgressImageView.image = #imageLiteral(resourceName: "progress-0")
//        yourProgressImages = createImageArray(total: 0, prefix: "progress")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        animate(imageView: yourProgressImageView, images: yourProgressImages)
    }
}
