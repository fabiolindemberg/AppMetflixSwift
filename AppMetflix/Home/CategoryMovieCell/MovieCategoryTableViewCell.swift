//
//  MovieTableViewCell.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit

class MovieCategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var cvCategory: UICollectionView!
    var category: Category!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadCell(with category: Category) {
        cvCategory.delegate = self
        cvCategory.dataSource = self
        self.category = category
    }
    
    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.category.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! CollectionViewCell
        cell.loadCell(with: category.movies![indexPath.row])
        return cell
    }
    

}
