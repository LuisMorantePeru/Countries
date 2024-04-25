//
//  HomeViewSpy.swift
//  CountriesTests
//
//  Created by Luis Morante on 25/04/24.
//

import XCTest
@testable import Countries

class HomeViewSpy : HomeViewProtocol {
    
    var view: UIViewController?
    
    var isReloadData = false
    var isSearchData = false
    
    func updateDataCountries(countries: [Countries.CountryResponse]) {
        isSearchData = true
    }
    
    func updateDataCountriesFiltered(countries: [Countries.CountryResponse]) {
        isReloadData = true
    }
    
}
