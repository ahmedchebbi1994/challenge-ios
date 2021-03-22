//
//  ApiService.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import Foundation
import RxSwift
open class ApiService {
    
    enum Constants: String {
        case headerContentType = "Content-Type"
        case contentTypeJson = "application/json"
        case contentTypeUrlEncoded = "application/x-www-form-urlencoded"
        case bankinVersion = "Bankin-Version"
        case bankinVersionValue = "2018-06-15"
    }
    
    enum RequestType {
        case get
        case post
    }
    
    enum ContentType {
        case json
        case urlencoded
    }
    
    enum Path{
        
        enum BaseUrl : String {
            case path = "https://sync.bankin.com/"
            case subPath = "v2/banks?limit=100"


        }
        
        enum Params: String {
            case banks = "banks"
            case version = "v2"
        }
        
        enum QueryData: String {
            case after = "after"
            case limit = "limit"
            case clientId = "client_id"
            case clientSecret = "client_secret"
            case clientIdValue = "dd6696c38b5148059ad9dedb408d6c84"
            case clientSecretValue = "56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ"
        }
        
    }
    
}

// MARK: - Private method
extension ApiService {
    func configureRequest(parameters: [String: String] ,url: URL,data: Data? = nil, requestType: RequestType,contentType: ContentType? = nil) -> URLRequest? {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        guard let myUrl = components?.url else {
            return nil
        }
        var request = URLRequest(url: myUrl)
        
        switch requestType {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        
        request.setValue(Constants.contentTypeJson.rawValue, forHTTPHeaderField: Constants.headerContentType.rawValue)
        request.setValue(Constants.bankinVersionValue.rawValue, forHTTPHeaderField: Constants.bankinVersion.rawValue)
        
        if let data = data {
            request.httpBody = data
        }
        return request
    }
    
 
}
