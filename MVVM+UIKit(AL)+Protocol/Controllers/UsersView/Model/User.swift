//
//  User.swift
//  MVVM+UIKit(AL)+Protocol
//
//  Created by Ishwar on 13/03/22.
//

import Foundation

// MARK: - UserElement

struct UserElement: Codable, Equatable {
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
    var isFavourite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
        case isFavourite = "isFavourite"
    }
}

// MARK: - Address

struct Address: Codable, Equatable {
    var street, suite, city, zipcode: String?
    var geo: Geo?
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
}

// MARK: - Geo

struct Geo: Codable, Equatable {
    var lat, lng: String?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
}

// MARK: - Company

struct Company: Codable, Equatable {
    var name, catchPhrase, bs: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }
}

typealias Users = [UserElement]
