//
//  UserAPITests.swift
//  MVVM+UIKit(AL)+ProtocolTests
//
//  Created by Ishwar on 13/03/22.
//

import XCTest
@testable import MVVM_UIKit_AL__Protocol

class UserAPITests: XCTestCase {
    
    func test_request_shouldReturnRequestNotNil() {
        
        let api = GetUsersAPI()
        let request = api.request()
        
        XCTAssertNotNil(request, "Was '\(String(describing: request))' but was expecting 'Not Nil'")
    }
    
    func test_request_shouldReturnRequestURLNotNil() {
        
        let api = GetUsersAPI()
        let request = api.request()
        
        XCTAssertNotNil(request?.url, "Was '\(String(describing: request?.url))' but was expecting 'Not Nil'")
    }
    
    func test_request_shouldReturnRequestURLSchemeHTTPS() {
        
        let expectedValue = "https"
        
        let api = GetUsersAPI()
        let request = api.request()
        let resultValue = request?.url?.scheme
        
        XCTAssertEqual(resultValue, expectedValue, "Was '\(String(describing: resultValue))' but was expecting '\(expectedValue)'")
    }
    
    func test_request_shouldReturnRequestURLHost() {
        
        let expectedValue = "jsonplaceholder.typicode.com"
        
        let api = GetUsersAPI()
        let request = api.request()
        let resultValue = request?.url?.host
        
        XCTAssertEqual(resultValue, expectedValue, "Was '\(String(describing: resultValue))' but was expecting '\(expectedValue)'")
    }
    
    func test_request_shouldReturnRequestURL() {
        
        let expectedValue = "https://jsonplaceholder.typicode.com/users"
        
        let api = GetUsersAPI()
        let request = api.request()
        let resultValue = request?.url?.absoluteString
        
        XCTAssertEqual(resultValue, expectedValue, "Was '\(String(describing: resultValue))' but was expecting '\(expectedValue)'")
    }
    
    func test_response_shouldReturnUsers() {
        
        let expectedValue = [
            UserElement(
                id: 123,
                name: "Test",
                username: "Test Username",
                email: "Test@test.com",
                address: Address(
                     street: "Test Street",
                     suite: "Test Suite",
                     city: "Test City",
                     zipcode: "123456",
                     geo: Geo(
                        lat: "12345.12345",
                        lng: "12345.12345"
                     )
                ),
                phone: "123456",
                website: "www.test.com",
                company: Company(
                    name: "Test Company",
                    catchPhrase: "Test Catch Phrase",
                    bs: "Test BS"
                )
            )
        ]
        
        guard
            let path = Bundle(for: type(of: self)).path(forResource: "users", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path, encoding: .utf8),
            let jsonData = jsonString.data(using: .utf8)
        else {
            return
        }
        
        let url = URL(string: APIPath.users)
        let api = GetUsersAPI()
        
        if let url = url,
           let httpResponse = HTTPURLResponse(
            url: url,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil) {
            
            let resultValue = try? api.response(jsonData, httpResponse: httpResponse)
            XCTAssertEqual(resultValue, expectedValue, "Was '\(String(describing: resultValue))' but was expecting '\(String(describing: expectedValue))'")
        }
    }
}
