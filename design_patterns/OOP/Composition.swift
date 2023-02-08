//
//  Composition.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Composition

/* Composition is a form of object-oriented design in which objects are created from other objects. This allows you to combine objects to create more complex objects, allowing you to reuse existing code and create systems with greater modularity and flexibility. */

protocol TestEngine {
    func move()
}

protocol Driver {
    func navigate()
}

class Transport {
    let engine: TestEngine
    let driver: Driver
    
    init(engine: TestEngine, driver: Driver) {
        self.engine = engine
        self.driver = driver
    }
    
    func deliver() {
        
    }
}

class Robots: Driver {
    func navigate() {
        
    }
}

class Humans: Driver {
    func navigate() {
        
    }
}

class PetrolsEngine: TestEngine {
    func move() {
        
    }
}

class ElectricsEngine: TestEngine {
    func move() {
        
    }
}
