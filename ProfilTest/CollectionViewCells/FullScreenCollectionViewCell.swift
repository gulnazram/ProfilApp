//
//  FullScreenCollectionViewCell.swift
//  ProfilTest
//
//  Created by Gulnaz on 24.10.2022.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }

}
