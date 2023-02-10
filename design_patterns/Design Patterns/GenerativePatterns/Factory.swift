//
//  Factory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 09.02.2023.
//

import Foundation

// MARK: - Factory

/*  Factory method (defines a common interface for creating objects in a superclass, allowing subclasses to change the type of objects they create).
 
 Allows you to create different products without specifying specific product classes.
 
 Implementation: The protocol defines standard behavior and delegates creation details to user-defined subclasses.
 */

// MARK: - Example 1

protocol Pizza {
    func createPizza()
}

class CheesePizza: Pizza {
    func createPizza() {
        
    }
}
class PepperoniPizza: Pizza {
    func createPizza() {
        
    }
}

enum PizzaType {
    case cheese
    case pepperoni
}

class PizzaFactory {
    
    // Always returns a protocol
    func create(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return CheesePizza()
        case .pepperoni:
            return PepperoniPizza()
        }
    }
}


