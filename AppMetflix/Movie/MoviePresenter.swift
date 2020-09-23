//
//  <#moduleName#>Presenter.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//

import Foundation

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol MoviePresenterDelegate: BasePresenterDelegate {
    func loadedData()
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

class MoviePresenter: BasePresenter {
    
    var delegate: MoviePresenterDelegate?
    var movie: Movie? = nil
    var recomendations: [Movie]?
    
    init (delegate: MoviePresenterDelegate?) {
        self.delegate = delegate
        
        super.init()
    }
}
