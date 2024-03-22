//
//  HomePresenter.swift
//  Countries
//
//  Created by Luis Morante on 5/03/24.
//

import Foundation

protocol HomePresenterInputProtocol {
    
    func getCountries()
    func selectCountry(country: CountryResponse)
    func searchCountry(name: String)
    
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
}

protocol HomePresenterOutputProtocol: AnyObject {
    
    func getCountriesResponse(countries: [CountryResponse])
    func getSearchResult(countries: [CountryResponse])
    
    var view: HomeViewProtocol? { get set }
    
}

protocol HomePresenterProtocol: HomePresenterInputProtocol, HomePresenterOutputProtocol {}

class HomePresenter : HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?

}

extension HomePresenter: HomePresenterOutputProtocol {
    
    func getCountriesResponse(countries: [CountryResponse]) {
        self.view?.updateDataCountries(countries: countries)
    }
    
    func getSearchResult(countries: [CountryResponse]) {
        view?.updateDataCountries(countries: countries)
    }
}

extension HomePresenter: HomePresenterInputProtocol{
    
    func selectCountry(country: CountryResponse) {
        router?.navigateToHomeDetail(country: country)
    }
    
    func searchCountry(name: String) {
        interactor?.searchCountry(name: name)
    }
    
    func getCountries() {
        interactor?.getCountries()
    }
    
}
