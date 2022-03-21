//
//  APILoader.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

struct APILoader<T: APIHandler> {
    
    // MARK: - Properties
    
    let api: T
    let session: URLSession
    
    // MARK: - Init
    
    init(api: T, session: URLSession = .shared) {
        
        self.api = api
        self.session = session
    }
    
    // MARK: - Methods
    
    func load(completion: @escaping(Result<T.ResponseType, APIError>) -> Void) {
        
        guard let request = api.request() else {
            return
        }
        
        session.dataTask(with: request) { data, httpResponse, error in
            
            guard let httpResponse = httpResponse as? HTTPURLResponse else {
                
                completion(.failure(APIError(code: 0, message: "Invalid http response")))
                return
            }
            
            guard error == nil else {
                
                completion(.failure(APIError(code: httpResponse.statusCode, message: httpResponse.debugDescription)))
                return
            }

            guard let data = data else {
                
                completion(.failure(APIError(code: httpResponse.statusCode, message: "Invalid data")))
                return
            }

            do {
                
                let response = try api.response(data, httpResponse: httpResponse)
                completion(.success(response))
            } catch {
                
                completion(.failure(APIError(code: httpResponse.statusCode, message: error.localizedDescription)))
            }
        }.resume()
    }
}
