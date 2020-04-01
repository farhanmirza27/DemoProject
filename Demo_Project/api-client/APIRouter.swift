//
//  APIRouter.swift
//  Demo_Project
//
//  Created by Farhan Mirza on 31/03/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case posts
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .posts:
            return .get
            
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .posts:
            return "/posts"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .posts:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let base = URL(string: DemoApp.Server.baseURL)!
        let baseAppend = base.appendingPathComponent(path).absoluteString.removingPercentEncoding
        let url = URL(string: baseAppend!)
        
        var urlRequest =  URLRequest(url: url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers

        // Note: not required for current demo but if required to add you can add them as follows
        
//        urlRequest.setValue(HTTPHeaderFieldValue.AcceptTenant.rawValue, forHTTPHeaderField: HTTPHeaderField.AcceptTenant.rawValue)
        
        // Parameters if added
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
