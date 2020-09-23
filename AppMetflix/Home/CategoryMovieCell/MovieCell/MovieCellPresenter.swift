//
//  MovieCellPresenter.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 23/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

class MovieCellPresenter {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func showMovie() {
        MovieCellRouter().show(movie: self.movie, recomendations: [self.movie])
    }
}
