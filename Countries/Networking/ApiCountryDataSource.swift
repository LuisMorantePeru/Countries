//
//  ApiCountryDataSource.swift
//  Countries
//
//  Created by Luis Morante on 7/03/24.
//

import Foundation

protocol APICountryDataSourceProtocol{
    
    func getCountry() async -> Result<[Country], HTTPClientError>
    
}

class APICountryDataSource: APICountryDataSourceProtocol{
    
    private let htppClient: HTTPClient
    
    init(htppClient: HTTPClient) {
        self.htppClient = htppClient
    }
    
    func getCountry() async -> Result<[Country], HTTPClientError> {
        let baseURL = Api.fullURL
        let endpoint = EndPoint(queryParams: [:], method: .get)
        let result = await htppClient.makeRequest(endPoint: endpoint, baseUrl: baseURL)
        guard case .success(let data) = result else {
            guard case .failure(let error) = result else{
                return .failure(.generic)
            }
            return .failure(error)
        }
        guard let countryList = try? JSONDecoder().decode([Country].self, from: data) else {
            return .failure(.parsingError)
        }
        return .success(countryList)
    }
    
}
