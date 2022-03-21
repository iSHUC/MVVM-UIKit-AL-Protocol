//
//  APIError.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

struct APIError: Error {
    
    let code: Int
    let message: String
}
