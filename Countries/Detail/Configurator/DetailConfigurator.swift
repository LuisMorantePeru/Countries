//
//  DetailConfigurator.swift
//  Countries
//
//  Created by Luis Morante on 5/03/24.
//

import UIKit

class DetailConfigurator {
    
    static func createModuleDetail(country: CountryResponse) -> UIViewController {
        let view = DetailCountryViewController(country: country)
        let presenter = DetailPresenter(countryDetail: country, view: view)
        view.presenter = presenter
        return view
    }

}
