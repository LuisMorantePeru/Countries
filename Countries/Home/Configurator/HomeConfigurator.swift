//
//  HomeConfigurator.swift
//  Countries
//
//  Created by Luis Morante on 7/03/24.
//

import Foundation

class HomeConfigurator {
    
    static func createModuleHome(view: CountryViewController){
        let build: HomeConfiguratorProtocol
        let buildConfig = HomeConcreteConfigurator()
        build = buildConfig
        var repository = build.createRepository()
        var presenter = build.createPresenter()
        var router = build.createRouter()
        let interactor = build.createInteractor(repository: repository, presenter: presenter)
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        router.view = view
    }
    
}
