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
    var delegate: HomePresenterDelegate?
    
    init (delegate: HomePresenterDelegate?) {
        self.delegate = delegate
        
        super.init()
    }
    
    func loadData() {
        HomeManager().loadData { [weak self] (movies) in
            
            if let _ = movies {
                
                self?.categories.append(Category(name: "Minha lista", movies: movies))
            }
            
            self?.delegate?.loadedData()
        }
    }
}
