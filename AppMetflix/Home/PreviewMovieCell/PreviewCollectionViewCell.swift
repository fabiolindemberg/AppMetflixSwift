//
//  PreviewCollectionViewCell.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 22/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit
import SDWebImage

class PreviewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCoverPreview: UIImageView!
    
    func loadCell(with movie: Movie) {
        
        self.layer.cornerRadius = self.frame.size.width / 2
        
        if let url = URL(string:movie.coverURL!) {
            imgCoverPreview.sd_setImage(with: url, completed: nil)
        }
    }
}
