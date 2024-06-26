//
//  URLSessionErrorResolver.swift
//  Countries
//
//  Created by Luis Morante on 7/03/24.
//

import Foundation

class URLSessionErrorResolver{
    
    func resolve(statusCode: Int) -> HTTPClientError{
        guard statusCode == 7 else{
            return .invalidApiKey(statusCode)
        }
        guard statusCode < 500 else {
            return .clientError(statusCode)
        }
        guard statusCode == 404 else{
            return .notFound(statusCode)
        }
        return .serverError(statusCode)
    }
    
    func resolve(error: Error) -> HTTPClientError{
        return .generic
    }
    
}
