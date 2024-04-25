//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Luis Morante on 15/03/24.
//

import XCTest
@testable import Countries

final class CountriesPresenterTests: XCTestCase {
    
    var sut : HomePresenter?
    var view : HomeViewSpy!
    var interactor : HomeInteractorSpy!
    var router : HomeRouterSpy!
    
    override func setUp() {
        super.setUp()
        sut = HomePresenter()
        view = HomeViewSpy()
        interactor = HomeInteractorSpy()
        router = HomeRouterSpy()
        
        sut?.view = view
        sut?.interactor = interactor
        sut?.router = router
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        view = nil
        interactor = nil
        router = nil
    }
    
    func test_givenPrensenter_searchCountry() {
        
        sut?.searchCountry(name: name)
        
        XCTAssertEqual(interactor.isSearchCountries, true, "isSearchCountries needs to be true")
    }
    
    func test_givenPresenter_getCountries() {
        
        sut?.getCountries()
        
        XCTAssertEqual(interactor.isGetCountries, true, "isGetCountries needs to be true")
        
    }
    
    func test_givenPresenter_selectCountry() {
        
        let countryName = Name(common: "", official: "")
        let flags = Flags(png: "")
        guard let region = Region(rawValue: "") else { return }

        let exampleCountry = Country(name: countryName, capital: nil, continents: [], region: region, flags: flags)
        
        let countryResponse = CountryResponse(country: exampleCountry)

        sut?.selectCountry(country: countryResponse)
        
        XCTAssertEqual(router.isgoHomeDetail, true, "isgoHomeDetail needs to be true")
        
    }
    
    func test_givenPresenter_getCountriesResponse() {
        
        let countryName = Name(common: "", official: "")
        let flags = Flags(png: "")
        guard let region = Region(rawValue: "") else { return }

        let exampleCountry = Country(name: countryName, capital: nil, continents: [], region: region, flags: flags)
        
        let countryResponse = [CountryResponse(country: exampleCountry)]

        sut?.getCountriesResponse(countries: countryResponse)
        
        XCTAssertEqual(view.isReloadData, true, "isgoHomeView needs to be true")
        
    }
    
    func test_givenPresenter_getSearchResult() {
        
        let countryName = Name(common: "", official: "")
        let flags = Flags(png: "")
        guard let region = Region(rawValue: "") else { return }

        let exampleCountry = Country(name: countryName, capital: nil, continents: [], region: region, flags: flags)
        
        let countryResponse = [CountryResponse(country: exampleCountry)]

        sut?.getSearchResult(countries: countryResponse)
        
        XCTAssertEqual(view.isSearchData, true, "isgoHomeView needs to be true")
        
    }

}
