//
//  APIHandler.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 12/03/22.
//

import Foundation

enum HTTPMethod: String {
    
    case get = "GET"
}

typealias APIHandler = RequestHandler & ResponseHandler
