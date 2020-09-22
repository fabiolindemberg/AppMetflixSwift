//
//  BaseManager.swift
//  Madeinweb
//
//  Created by Alberto Lourenço on 03/01/19.
//  Copyright © 2019 Madeinweb. All rights reserved.
//

import Foundation

class BaseManager {
    
    
    let unknownError = APIResponseException(code: 0,
                                            message: Constants.Messages.UnknowError)
    
    //-----------------------------------------------------------------------
    //  MARK: - Base Request
    //-----------------------------------------------------------------------
    
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any>,
                              responseType: T.Type,
                              completion: @escaping (_ response: Any?, _ code: Int) -> Void) {
        
        var serverURL: String = Constants.API.BaseURL + endpoint
        
        let request = NSMutableURLRequest()
        request.timeoutInterval = 10
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        switch method {
            
            case .get:
                serverURL += parameters.buildQueryString()
                request.httpMethod = "GET"
                break
            
            case .patch:
                serverURL += parameters.buildQueryString()
                request.httpMethod = "PATCH"
                break
            
            case .put:
                request.httpMethod = "PUT"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                break
            
            case .post:
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                break
            
            case .delete:
                request.httpMethod = "DELETE"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                break
            
            case .formEncoded:
                request.httpMethod = "POST"
                request.httpBody = parameters.buildQueryString().replacingOccurrences(of: "?", with: "").data(using: String.Encoding.utf8)!
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                break
        }
        
//        if let token = Session.get()?.token {
//            request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
//        }
        
        request.url = URL(string: serverURL)
        
        print("------------------------------------------------------------------")
        print("Parameters: \(parameters)")
        print("Request URL: \(request.url!.absoluteString)")
        print("------------------------------------------------------------------")
        
        //---------------------------------------------------------
        //  Load API
        //---------------------------------------------------------
        
        DispatchQueue.global().async {
         
            let task = session.dataTask(with: request as URLRequest,
                                        completionHandler: {data, response, error -> Void in
                
                DispatchQueue.main.async {
                    
                    let responseCode = response?.getStatusCode() ?? 0
                    
                    guard error == nil else {
                        completion(nil, responseCode)
                        return
                    }
                    
                    if let responseData = data, responseData.count != 0 {
                        
                        if let responseString = String(data: responseData, encoding: .utf8) {
                            
                            print("Response: \(responseString)")
                            
                            do {
                                let error = try JSONDecoder().decode(APIResponseException.self,
                                                                     from: responseData)
                                completion(error, responseCode)
                                return
                            }catch{
                                
                                if T.self == String.self {
                                    completion(responseString, responseCode)
                                    return
                                }
                            }
                        }
                        
                        //  Parsing API result
                        
                        do {
                            
                            let parse = try JSONDecoder().decode(T.self, from: responseData)
                            completion(parse, responseCode)
                            
                        }catch{
                            
                            //  Handling parse error
                            
                            print(error)
                            
                            do {
                                let error = try JSONDecoder().decode(APIResponseException.self,
                                                                     from: responseData)
                                completion(error, responseCode)
                            }catch{
                                print(error)
                                completion(nil, responseCode)
                            }
                        }
                    }else{
                        completion(nil, responseCode)
                    }
                }
            })
            
            task.resume()
        }
    }
}
