//
//  APIClient.swift
//  Demo_Project
//
//  Created by Farhan Mirza on 31/03/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    // generic call to re-use code.
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response.result)
        }
    }

    // MARK: - Posts
    static func getPosts(completion:@escaping (AFResult< [Post]>)->Void) {
        performRequest(route: APIRouter.posts,completion: completion)
    }

}
