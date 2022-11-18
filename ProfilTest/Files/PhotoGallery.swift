//
//  PhotoGallery.swift
//  ProfilTest
//
//  Created by Gulnaz on 24.10.2022.
//

import Foundation
import UIKit

class PhotoGallery {
    var images = [UIImage]()
    
    init() {
        setupGallery()
    }
    
    func setupGallery() {
        for i in 0...7{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
}
