//
//  CountryRepository.swift
//  Countries
//
//  Created by Luis Morante on 3/03/24.
//

import Foundation

enum CountryDomainError: Error {
    
    case generic
    
}

protocol CountryRepositoryProtocol {
    
    func getCountry() async -> Result<[CountryResponse], CountryDomainError>
    
}

class CountryRepository: CountryRepositoryProtocol{
    
    private let apiDataSource: APICountryDataSource
    private let errorMapper: CountryDomainErrorMapper
    
    init(apiDataSource: APICountryDataSource, errorMapper: CountryDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getCountry() async -> Result<[CountryResponse], CountryDomainError>  {
        let countryListResult = await apiDataSource.getCountry()
        
        guard case .success(let countryList) = countryListResult else {
            return .failure(errorMapper.map(error: countryListResult.failureValue as? HTTPClientError))
        }
        
        let countryArray = countryList.map{ country in
            return CountryResponse(country: country)
        }
        
        return .success(countryArray)
    }
    
}

class CountryDomainErrorMapper{
    
    func map(error: HTTPClientError?) -> CountryDomainError{
        return .generic
    }
    
}
    

