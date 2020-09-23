//
//  HomePresenter.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//

import Foundation

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol HomePresenterDelegate: BasePresenterDelegate {
    func loadedData()
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

class HomePresenter: BasePresenter {
    
    var categories: [Category] = []
    var movies: [Movie] = []
    var delegate: HomePresenterDelegate?
    
    init (delegate: HomePresenterDelegate?) {
        self.delegate = delegate
        
        super.init()
    }
    
    func loadData() {
        HomeManager().loadData { (movies) in
            
            if let _ = movies {

                self.movies = movies ?? []
                
                var category :Category? = nil
                
                let moviesCategorized = movies!.sorted { (movie1, movie2) -> Bool in
                    return movie1.category > movie2.category
                }
                
                moviesCategorized.forEach { (movie) in
                    
                    if category == nil {
                        category = Category(name: movie.category, movies: [])
                    }
                    
                    if category!.name != movie.category || moviesCategorized.last == movie {
                        
                        if moviesCategorized.last == movie {
                            category?.movies?.append(movie)
                        }
                        
                        self.categories.append(category!)
                        category = Category(name: movie.category, movies: [movie])
                    } else {
                        category?.movies?.append(movie)
                    }
                }
            }
            
            self.delegate?.loadedData()
        }
    }
    
    func show(movie: Movie) {
        HomeRouter().show(movie: movie, recomendations: movies)
    }
}
