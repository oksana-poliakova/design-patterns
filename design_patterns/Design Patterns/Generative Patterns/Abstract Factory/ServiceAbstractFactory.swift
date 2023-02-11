//
//  ServiceAbstractFactory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation

// service protocols
protocol ServiceFactory {
    func create() -> Service
}

protocol Service {
    var url: URL { get }
}

// staging
class StagingService: Service {
    var url: URL { return URL(string: "https://dev.localhost/")! }
}

class StagingServiceFactory: ServiceFactory {
    func create() -> Service {
        return StagingService()
    }
}

// production
class ProductionService: Service {
    var url: URL { return URL(string: "https://live.localhost/")! }
}

class ProductionServiceFactory: ServiceFactory {
    func create() -> Service {
        return ProductionService()
    }
}

// abstract factory
class AppServiceFactory: ServiceFactory {

    enum Environment {
        case production
        case staging
    }

    var env: Environment

    init(env: Environment) {
        self.env = env
    }

    func create() -> Service {
        switch self.env {
        case .production:
            return ProductionServiceFactory().create()
        case .staging:
            return StagingServiceFactory().create()
        }
    }
}

func useAbstractFactory() {
    let factory = AppServiceFactory(env: .production)
    let service = factory.create()
    print(service.url)
}
