//
//  Constants.swift
//  Demo_Project
//
//  Created by Farhan Mirza on 31/03/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation


struct DemoApp {
    struct Server {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    
    
    struct APIParameterKey {
        // TODO : can be added in future
        // Note : No parametrs used for current demo project so you can add them as follow
    }
}



// Note : header fields not required for current demo but if required to add thats how you add as defined below

//
//// header fields
//enum HTTPHeaderField: String {
//    case AcceptTenant = "Accept-Tenant"
//    case AcceptLanguage = "Accept-Language"
//    case  Authorization = "Authorization"
//    case Host = "Host"
//
//}
//
//// header fields values
//enum HTTPHeaderFieldValue: String {
//
//    case AcceptTenant = "uk"
//    case AcceptLanguage = "en-GB"
//    case Host = "public.je-apis.com"
//}
