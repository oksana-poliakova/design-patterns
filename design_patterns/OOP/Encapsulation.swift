//
//  Encapsulation.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.

import Foundation

// MARK: - Example 1

/* In this example, the Car class has two private (hidden) properties model and year, which store the model and year of the car, respectively.
 
 The class also has methods for accessing and changing these properties, such as getModel(), setModel(model:), getYear(), and setYear(year:). By using these methods, we can control access to the data stored in the class and ensure that the data remains consistent and reliable. */

class Car {
    private var model: String
    private var year: Int
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    public func getModel() -> String {
        return model
    }
    
    public func setModel(model: String) {
        self.model = model
    }
    
    public func getYear() -> Int {
        return year
    }
    
    public func setYear(year: Int) {
        self.year = year
    }
}

class TeslaCar {
    let car = Car(model: "Tesla Model S", year: 2021)
    
    func getInfoAboutCar() {
        print("Car Model: \(car.getModel())")
        print("Car Year: \(car.getYear())")

        car.setModel(model: "Tesla Model 3")
        car.setYear(year: 2022)

        print("Car Model: \(car.getModel())")
        print("Car Year: \(car.getYear())")
    }
}


