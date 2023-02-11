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

/* For this system to work, all returned objects should have a common interface. Subclasses will be able to drive objects of different classes following the same and the same interface.
 
 For the client of the factory method, there is no difference between these objects, since it will treat them as some kind of abstract object. It will be important for him that the object has only the desired method, but how exactly it works is not important. */
 
 // MARK: - USAGE:

 /* - When the types and dependencies of the objects that your code must work with are not known in advance.

 - When you want to save system resources by reusing already created objects instead of spawning new ones.

 Implementation steps

  1. Bring all created products to a common interface. 2. In the class that produces products, create an empty factory method. Specify the common product interface as the return type.

  2. Then go through the class code and find all the sites that create products. Replace these sections one by one with factory method calls, transferring the code for creating various products into it.

  3. You may need to add a few parameters to the factory method to control which product to create.
  
  4. For each product type, create a subclass and override the factory method in it. Move the creation code of the corresponding product from the superclass there.
 */



// MARK: -  Advantages and disadvantages

/*

 + Saves the class from binding to specific product classes.

 + Separates the product manufacturing code into one place, making it easier to maintain the code.

 + Simplifies adding new products to the program.
 + Implements the principle of openness/closeness.

 - Can lead to the creation of large parallel class hierarchies, since for each product class it is necessary to create its own subclass of the creator.
 */
