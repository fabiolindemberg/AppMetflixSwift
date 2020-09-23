//
//  CollectionViewCell.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCover: UIImageView!
    var presenter: MovieCellPresenter!
    
    func loadCell() {
        
        if let url = URL(string:presenter.movie.coverURL!) {
            imgCover.sd_setImage(with: url, completed: nil)
        }
    }
    
    func showMovie() {
        presenter.showMovie()
    }
}
