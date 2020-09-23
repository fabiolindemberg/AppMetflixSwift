//
//  HomeTableViewController.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController,
                               HomePresenterDelegate,
                               UICollectionViewDelegate,
                               UICollectionViewDataSource{

    @IBOutlet var imgCover: UIImageView!
    @IBOutlet weak var cvMoviePreview: UICollectionView!
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.categories.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.categories[section].name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCategoryCell") as! MovieCategoryCell
        cell.loadCell(with: presenter.categories[indexPath.section])
        return cell
    }
    
    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
        cell.loadCell(with: self.presenter.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.show(movie: self.presenter.movies[indexPath.row])
    }

    // MARK: - PresenterDelegate
    
    func loadedData() {
         
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.cvMoviePreview.reloadData()
        }
    }
}
