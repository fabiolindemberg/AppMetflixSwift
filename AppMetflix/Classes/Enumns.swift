//
//  Enumns.swift
//  AppMetflix
//
//  Created by Fabio Lindemberg on 21/09/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import Foundation

//-----------------------------------------------------------------------
//    Struct: BaseRouter
//-----------------------------------------------------------------------

enum PresentationStyle {
    case modal
    case push
}

//------------------------------------------------------------
//    Util - Messages
//------------------------------------------------------------

public enum MessageType {
    case success
    case warning
    case error
}

//------------------------------------------------------------
//    Struct: BaseManager
//------------------------------------------------------------

enum ResponseError: Error {
    case none
    case unknown
    case invalidCredentials
}

enum RequestType {
    case get
    case post
    case put
    case patch
    case delete
    case formEncoded
}

enum TypeOperation {
    case edit
    case insert
}

//-----------------------------------------------------------------------
//  MARK: - URLResponse
//-----------------------------------------------------------------------

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
