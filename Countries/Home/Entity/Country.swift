//
//  Post.swift
//  Countries
//
//  Created by Luis Morante on 20/02/24.
//

import Foundation

struct Country: Codable {

    let name: Name
    let capital: [String]?
    let continents : [Continent]
    let region: Region
    let flags: Flags
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case capital = "capital"
        case continents = "continents"
        case region = "region"
        case flags = "flags"
        
    }
    
}

struct Name: Codable {
    
    let common: String
    let official:String
    
}

enum Continent: String, Codable {
    
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
    
}

enum Region: String, Codable {
    
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
    
}

struct Flags: Codable {
    
    let png: String
    
}
