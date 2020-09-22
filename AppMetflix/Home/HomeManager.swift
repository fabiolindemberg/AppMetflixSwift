//
//  HomeManager.swift
//  Bíblia Fiel
//
//  Created by Alberto Lourenço on 1/31/20.
//  Copyright © 2020 Madeinweb. All rights reserved.
//

import Foundation

class HomeManager: BaseManager {
    
    func loadData(_ completion: @escaping (_ response: Array<Movie>?) -> Void) {
        
        request(method: .get, endpoint: Constants.EndPoints.Movies, parameters: Dictionary(), responseType: Array<Movie>.self) { (movies, statusCode) in
            completion(movies as? Array<Movie>)
        }

    }
    
    
}
