//
//  Polymorphism.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Polymorphism. Example 1.

/* In this example, the Animal protocol defines a single makeSound() method. All classes conform to the Animal protocol by providing their own implementation of the makeSound() method.
 
 The makeAnimalSounds(animals:) function takes an array of Animal objects and calls the makeSound() method on each one.
 
 Because all objects in the array conform to the Animal protocol, they can be passed to this function and used interchangeably, even if they have different implementations of the makeSound() method. */

protocol Animal {
    func makeSound()
}

class Dog: Animal {
    func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    func makeSound() {
        print("Meow!")
    }
}

class Parrot: Animal {
    func makeSound() {
        print("Squawk!")
    }
}

func makeAnimalSounds(animals: [Animal]) {
    for animal in animals {
        animal.makeSound()
    }
}

func summarySounds() {
    let animals: [Animal] = [Dog(), Cat(), Parrot()]
    makeAnimalSounds(animals: animals)
}

// MARK: - Example 2

/* class Company {
    func createSoftware() { }
}

class Programmer {
    func writeCode() { }
}

class Tester {
    func testCode() { }
}

class Designer {
    func makeDesign() { }
}
*/

// It's better doing using polymorphism

protocol BasicEmployee {
    func doWork()
}

class Programmer: BasicEmployee {
    func doWork() {
        
    }
}

class Designer: BasicEmployee {
    func doWork() {
        
    }
}

class Tester: BasicEmployee {
    func doWork() {
        
    }
}

private func getEmployees() {
    let prog = Programmer()
    let design = Designer()
    let tester = Tester()

    var employees: [BasicEmployee] = [prog, design, tester]
    
    employees.forEach { employee in
        employee.doWork()
    }
}

