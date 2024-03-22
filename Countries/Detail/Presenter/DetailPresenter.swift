//
//  DetailPresenter.swift
//  Countries
//
//  Created by Luis Morante on 5/03/24.
//

import Foundation

protocol DetailPresenterProtocol{
    
    func getCountry()
    
}

class DetailPresenter {
    
    weak var view: HomeViewDetailProtocol?
    
    private var countryDetail: CountryResponse
    
    required init(countryDetail: CountryResponse, view: HomeViewDetailProtocol) {
        self.countryDetail = countryDetail
        self.view = view
    }
    
}

extension DetailPresenter : DetailPresenterProtocol {
    
    func getCountry() {
        view?.updateDetailCountry(country: countryDetail)
    }
    
}
