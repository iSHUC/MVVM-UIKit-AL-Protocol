//
//  APIPath.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

enum APIPath {
    
    // MARK: - Base URL
    
    private static let baseURL = "https://jsonplaceholder.typicode.com/"
    
    // MARK: - Endpoints
    
    static var users: String { baseURL + "users" }
}
