//
//  CollectionViewCell.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCover: UIImageView!
    
    func loadCell(with movie: Movie) {
        if let url = URL(string:movie.coverURL!) {
            imgCover.sd_setImage(with: url, completed: nil)
        }
    }
}
