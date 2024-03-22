//
//  Extensions+Result.swift
//  Countries
//
//  Created by Luis Morante on 8/03/24.
//

import Foundation

extension Result {
    
    var failureValue: Error? {
        switch self{
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
    
}
