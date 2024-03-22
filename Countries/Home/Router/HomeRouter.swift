//
//  HomeRouter.swift
//  Countries
//
//  Created by Luis Morante on 5/03/24.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    
    func navigateToHomeDetail(country: CountryResponse)
    var view: UIViewController? { get set }
    
}

class HomeRouter :  HomeRouterProtocol {
   
    weak var view: UIViewController?
    
    func navigateToHomeDetail(country: CountryResponse) {
        let detailCountry = DetailConfigurator.createModuleDetail(country:country)
        view?.navigationController?.pushViewController(detailCountry, animated: true)
    }
}
