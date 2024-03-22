//
//  HomeConcreteConfigurator.swift
//  Countries
//
//  Created by Luis Morante on 7/03/24.
//

import Foundation

protocol HomeConfiguratorProtocol{

    func createRepository() -> CountryRepositoryProtocol
    func createPresenter() -> HomePresenterProtocol
    func createInteractor(repository: CountryRepositoryProtocol, presenter: HomePresenterProtocol) -> HomeInteractorProtocol
    func createRouter() -> HomeRouterProtocol

}

class HomeConcreteConfigurator: HomeConfiguratorProtocol{

    func createRepository() -> CountryRepositoryProtocol {
        let repository = CountryRepository(apiDataSource: APICountryDataSource(htppClient: URLSessiónHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())), errorMapper: CountryDomainErrorMapper())
        return repository
    }
    
    func createPresenter() -> HomePresenterProtocol {
        return HomePresenter()
    }
    
    func createInteractor(repository: CountryRepositoryProtocol, presenter: HomePresenterProtocol) -> HomeInteractorProtocol {
        return HomeInteractor(repository: repository, presenter: presenter)
    }
    
    func createRouter() -> HomeRouterProtocol {
        return HomeRouter()
    }
    
}
