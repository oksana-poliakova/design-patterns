//
//  Inheritance.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Inheritance. Example 1.

/* In this example, the InheritanceVehicle class defines a basic set of properties and methods that describe a vehicle.
 
 The CarTest and Motorcycle classes inherit from the Vehicle class, inheriting its properties and methods and adding their own properties and methods. The CarTest class has a number of doors property and an overridden move() method, and the Motorcycle class has an overridden move() method.
 
 Using inheritance, we can create new classes based on the behavior of existing ones, making it easy to create new classes with similar functionality. */

class InheritanceVehicle {
    var wheels: Int
    
    init(wheels: Int) {
        self.wheels = wheels
    }
    
    func move() {
        print("Vehicle is moving.")
    }
}

class CarTest: InheritanceVehicle {
    var doors: Int
    
    init(wheels: Int, doors: Int) {
        self.doors = doors
        super.init(wheels: wheels)
    }
    
    override func move() {
        print("Car is moving.")
    }
}

class Motorcycle: InheritanceVehicle {
    override func move() {
        print("Motorcycle is moving.")
    }
}

final class TestInheritanceVehicle {
  
    func doSomethingWithVehicle() {
        let car = CarTest(wheels: 4, doors: 4)
        let motorcycle = Motorcycle(wheels: 2)
        
        car.move()
        print("Number of wheels: \(car.wheels)")
        print("Number of doors: \(car.doors)")

        motorcycle.move()
        print("Number of wheels: \(motorcycle.wheels)")
    }
}


