//
//  HomeInteractor.swift
//  Countries
//
//  Created by Luis Morante on 5/03/24.
//

import Foundation

protocol HomeInteractorProtocol {
    
    func getCountries()
    func searchCountry(name:String)
    
}

class HomeInteractor {
    
    var repository: CountryRepositoryProtocol?
    var presenter: HomePresenterOutputProtocol?
    
    private var countries: [CountryResponse] = []
    private var filteredCountries: [CountryResponse] = []

    init(repository: CountryRepositoryProtocol , presenter: HomePresenterOutputProtocol) {
        self.repository = repository
        self.presenter = presenter
    }

}

extension HomeInteractor : HomeInteractorProtocol {
    
    func searchCountry(name: String) {
        let filteredCountries = filterCountriesByName(countries: countries, name: name)
        presenter?.getSearchResult(countries: filteredCountries)
    }
    
    func getCountries() {
        Task{
            let result = await repository?.getCountry()
            let countryResponse = try? result?.get()
            Task{@MainActor in
                guard let countryResponse = countryResponse else {
                    return
                }
                let sortedCountries = countryResponse.sorted { $0.name < $1.name }
                self.countries = sortedCountries
                presenter?.getCountriesResponse(countries: sortedCountries)
            }
        }
    }
    
    private func filterCountriesByName(countries: [CountryResponse], name: String) -> [CountryResponse] {
        let filteredCountries = countries.filter { country in
            if !name.isEmpty {
                return country.name.lowercased().contains(name.lowercased())
            }
            return true
        }
        let sortedCountries = filteredCountries.sorted { $0.name < $1.name }
        return sortedCountries
    }
}
