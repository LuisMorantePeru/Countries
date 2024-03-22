//
//  HTTPClientError.swift
//  Countries
//
//  Created by Luis Morante on 7/03/24.
//

import Foundation

enum HTTPClientError: Error{
    
    case clientError(Int)
    case serverError(Int)
    case generic
    case parsingError
    case urlError
    case responseError
    case invalidApiKey(Int)
    case notFound(Int)
    
}
