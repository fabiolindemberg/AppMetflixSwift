//
//  MovieRouter.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//

import UIKit

class MovieRouter: BaseRouter {
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(movie: Movie, recomendations: [Movie]?) {
        super.init()
        
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieView")
        
        if let controller = vc as? MovieViewController {
            
            let presenter = MoviePresenter(delegate: controller)
            presenter.movie = movie
            presenter.recomendations = recomendations
            controller.presenter = presenter
            controller.presenter.view = viewController
            controller.presenter.router = self
            
            viewController = controller
        }
    }
}
