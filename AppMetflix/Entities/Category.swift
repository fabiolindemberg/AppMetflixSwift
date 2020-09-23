//
//  Category.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

struct Category: Codable {
    let name: String!
    var movies: [Movie]?
}
