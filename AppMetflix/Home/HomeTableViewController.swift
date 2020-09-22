//
//  HomeTableViewController.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, HomePresenterDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var imgCover: UIImageView!
    var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = HomePresenter(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.loadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCategoryCell") as! MovieCategoryTableViewCell
        cell.loadCell(with: presenter.categories[indexPath.section])
        return cell
    }
    
    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCell", for: indexPath)
    }

    // MARK: - PresenterDelegate
    
    func loadedData() {
         
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
