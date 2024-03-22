//
//  RegionResponse.swift
//  Countries
//
//  Created by Luis Morante on 21/02/24.
//

import Foundation

struct CountryResponse : Codable {
    
    let name: String
    let capital : String
    let continents : String
    let region: String
    let flags: String
    
    init(country: Country) {
        self.name =  country.name.common
        self.region = country.region.rawValue
        self.flags = country.flags.png
        self.continents = country.continents.map{ $0.rawValue }.joined(separator: ", " )
        self.capital = country.capital?.joined(separator: ", ") ?? ""
    }
    
}
