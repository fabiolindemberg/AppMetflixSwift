//
//  ApiResponse.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

struct APIResponseNone: Codable {}

struct APIResponse<T: Codable>: Codable {
    
    let data: T?
    let context: String?
    let id: String?
    let type: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "hydra:member"
        case context = "@context"
        case id = "@id"
        case type = "@type"
        case message
    }
}

struct APIResponseSuccess: Codable {
    
    var code: Int?
    var message: String
    
    enum CodingKeys: String, CodingKey {
        
        case code               = "statusCode"
        case message            = "message"
    }
}

struct APIResponseException: Codable {
    
    var code: Int?
    var message: String
    
    enum CodingKeys: String, CodingKey {
        
        case code               = "statusCode"
        case message            = "message"
    }
}

struct APIResponseException2: Codable {
    
    var message: String
    
    enum CodingKeys: String, CodingKey {
        
        case message            = "validationErros"
    }
}
