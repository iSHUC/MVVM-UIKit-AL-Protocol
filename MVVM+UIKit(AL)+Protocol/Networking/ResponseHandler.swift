//
//  ResponseHandler.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 12/03/22.
//

import Foundation

protocol ResponseHandler {
    
    associatedtype ResponseType
    
    func response(_ data: Data, httpResponse: HTTPURLResponse) throws -> ResponseType
}

extension ResponseHandler {
    
    func parseResponse<DataType: Codable>(_ data: Data, httpResponse: HTTPURLResponse) throws -> DataType {
        
        do {
            if httpResponse.statusCode == 200 {
                return try JSONDecoder().decode(DataType.self, from: data)
            } else {
                throw APIError(code: httpResponse.statusCode, message: httpResponse.debugDescription)
            }
        } catch {
            throw APIError(code: httpResponse.statusCode, message: error.localizedDescription)
        }
    }
}
