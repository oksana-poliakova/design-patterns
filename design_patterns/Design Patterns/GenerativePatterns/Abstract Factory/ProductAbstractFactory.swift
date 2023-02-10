//
//  ProductAbstractFactory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation

// The Abstract Factory interface declares a set of methods that return // various abstract products. These products are called a family.

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

// Each individual product in the product family must have a base interface.

protocol AbstractProductA {
    
}

protocol AbstractProductB {
    
}

class iPhoneA1: AbstractProductA {
    
}

class iPhoneA2: AbstractProductA {
    
}

class iPadA1: AbstractProductB {
    
}

class iPadA2: AbstractProductB {
    
}

// Concrete Factory produces a family of products of one variation.

class Factory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return iPhoneA1()
    }
    
    func createProductB() -> AbstractProductB {
        return iPadA1()
    }
}

class Factory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return iPhoneA2()
    }
    
    func createProductB() -> AbstractProductB {
        return iPadA2()
    }
}

// Client code works with factories and products only through abstract types

class Client {
    static func createProducts(for factory: AbstractFactory) {
        let productA = factory.createProductA()
        let productB = factory.createProductB()
    }
}

class AbstractFactoryImplementation {
    func productCreation() {
        Client.createProducts(for: Factory1())
        Client.createProducts(for: Factory2())
    }
}

