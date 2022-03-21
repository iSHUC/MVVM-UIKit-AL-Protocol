//
//  GetUsersAPI.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

struct GetUsersAPI: APIHandler {
    
    // MARK: - Request
    
    func request() -> URLRequest? {
        
        guard let url = URL(string: APIPath.users) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
    
    // MARK: - Response
    
    func response(_ data: Data, httpResponse: HTTPURLResponse) throws -> Users {
        
        try parseResponse(data, httpResponse: httpResponse)
    }
}
