//
//  MovieCellRouter.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 23/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

class MovieCellRouter: BaseRouter {
    
    func show(movie: Movie, recomendations: [Movie]?) {
        MovieRouter(movie: movie, recomendations: recomendations).present()
    }
}

