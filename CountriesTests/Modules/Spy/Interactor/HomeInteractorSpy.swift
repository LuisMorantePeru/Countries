//
//  HomeInteractorSpy.swift
//  CountriesTests
//
//  Created by Luis Morante on 25/04/24.
//

import XCTest
@testable import Countries

class HomeInteractorSpy : HomeInteractorProtocol {
    
    var isGetCountries = false
    var isSearchCountries = false
    
    func getCountries() {
        isGetCountries = true
    }
    
    func searchCountry(name: String) {
        isSearchCountries = true
    }
    
    
}
