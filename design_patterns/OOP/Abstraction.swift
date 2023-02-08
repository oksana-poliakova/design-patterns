//
//  Abstraction.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Abstraction. Example 1

/* In this example, the Engine protocol defines two methods, start() and stop(), that describe the behavior of the engine. The Car class takes an Engine instance and interacts with it to start and stop the car's engine without knowing the specific engine implementation details.
 
 This allows the Car class to be abstracted from the engine information and makes it easy to switch between different engine types, such as gasoline and electric, without changing the code in the Car class. */

protocol Engine {
    func start()
    func stop()
}

class AbstractionCar {
    private let engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    public func startEngine() {
        engine.start()
    }
    
    public func stopEngine() {
        engine.stop()
    }
}

class PetrolEngine: Engine {
    func start() {
        print("Petrol engine started.")
    }
    
    func stop() {
        print("Petrol engine stopped.")
    }
}

class ElectricEngine: Engine {
    func start() {
        print("Electric engine started.")
    }
    
    func stop() {
        print("Electric engine stopped.")
    }
}

final class TestCar {

    private func checkCars() {
        let petrolCar = AbstractionCar(engine: PetrolEngine())
        let electricCar = AbstractionCar(engine: ElectricEngine())
        
        petrolCar.startEngine()
        petrolCar.stopEngine()

        electricCar.startEngine()
        electricCar.stopEngine()
    }
}
