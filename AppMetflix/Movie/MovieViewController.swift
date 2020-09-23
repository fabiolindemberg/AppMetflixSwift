//
//  MovieViewController.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//

import UIKit
import SDWebImage

class MovieViewController: BaseViewController,
                           MoviePresenterDelegate,
                           UICollectionViewDelegate,
                           UICollectionViewDataSource{
    
    @IBOutlet weak var imgMainMovieCover: UIImageView!
    @IBOutlet weak var imgBackgroundMovieCover: UIImageView!
    @IBOutlet weak var lblRelevant: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblCasting: UILabel!
    @IBOutlet weak var lblCreators: UILabel!
    
    var presenter: MoviePresenter!
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        
        self.view.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - BaseViewController
    //-----------------------------------------------------------------------
    
    override func configDarkMode() {
        super.configDarkMode()
        
    }
    
    override func navbarLeftButtonTapped() {
        
        // presenter.closeView()
    }
    
    override func navbarRightButtonTapped() {
        
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate
    //-----------------------------------------------------------------------
    
    func loadedData() {
        
    }
    
    func loading(_ loading: Bool) {
        
//        if loading {
//            Util.showHUD()
//        }else{
//            Util.hideHUD()
//        }
    }
    
    func message(message: String?, type: MessageType) {
        
        if let text = message {
//            Util.showMessage(text, type)
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    func configUI() {
        
    }
    
    func loadUI() {
        
        lblRelevant.text = presenter.movie!.relevant + "% relevante"
        lblYear.text = presenter.movie!.year
        lblAge.text = presenter.movie!.age
        lblTemp.text = presenter.movie!.temp
        lblText.text = presenter.movie!.text
        lblCasting.text = "Casting: " + presenter.movie!.casting
        lblCreators.text = "Creators: " + presenter.movie!.creators

        if let url = URL(string: presenter.movie!.coverURL) {
            imgMainMovieCover.sd_setImage(with: url, completed: nil)
            imgBackgroundMovieCover.sd_setImage(with: url, completed: nil)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 1
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.presenter.router.dismiss()
    }
    
    // MARK: - UICollectionViewDelegate and UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.recomendations?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomendationCell", for: indexPath) as! MovieCell
        cell.presenter = MovieCellPresenter(movie: presenter.recomendations![indexPath.row])
        cell.loadCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.alpha = 0
        presenter.movie = presenter.recomendations![indexPath.row]
        self.loadUI()
    }
}
