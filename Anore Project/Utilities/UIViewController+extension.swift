//
//  UIViewController+extension.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

extension UIViewController {
    func createImageArray(total: Int, prefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        for imageCount in 1..<total {
            let imageName = "\(prefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage], duration: Double) {
        imageView.animationImages = images
        imageView.animationDuration = duration
        imageView.animationRepeatCount = 3
        imageView.startAnimating()
    }
}
