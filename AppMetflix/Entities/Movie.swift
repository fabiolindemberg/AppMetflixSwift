//
//  Movie.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

struct Movie : Codable, Equatable {
    let category: String!
    let title: String!
    let coverURL: String!
    let text: String!
    let year: String!
    let temp: String!
    let casting: String!
    let creators: String!
    let time: String!
    let age: String!
    let progress: String!
    let relevant: String!
    
}
