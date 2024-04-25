//
//  HomeRouterSpy.swift
//  CountriesTests
//
//  Created by Luis Morante on 19/04/24.
//

import XCTest
@testable import Countries

class HomeRouterSpy: HomeRouterProtocol {
   
    var view: UIViewController?
    var isgoHomeDetail = false
    
    func navigateToHomeDetail(country: Countries.CountryResponse) {
        isgoHomeDetail = true
    }
    
}
