//
//  AbstractFactory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation

// MARK: - Abstract factory

/* An abstract factory is a generative design pattern that allows you to create families of related objects without being tied to the specific classes of objects you create.
 
 You need a way to create product objects that matches other products in the same family.

 - Solution -

 To begin with, the Abstract Factory pattern proposes to highlight common interfaces for individual products that make up a family.

 Next, you create an abstract factory - a common interface that contains methods for creating all products of the family.

 These operations must return the abstract product types represented by the interfaces we identified earlier.
 */

// MARK: - Structure

/*
 1. Abstract products declare product interfaces that are related in meaning but perform different functions.
 
 2. Concrete products - a large set of classes that refer to different abstract products (chair/table) but have the same variations (Victorian/Modern).

 3. The abstract factory declares methods for creating various abstract products (chair/table).

 4. Concrete factories are each related to their product variation (Victorian/Modern) and implement abstract factory methods, allowing you to create all products of a certain variation. */

// MARK: - Applicability

/*
 When the business logic of the program must work with different types of related products, regardless of specific product classes.

 The abstract factory hides from the client code the details of how and what specific objects will be created. But at the same time, the client code can work with all types of created products, since their common interface has been predefined.

 When the program is already using the Factory method, but the next changes involve the introduction of new types of products.
 */

// MARK: -  Implementation steps

/*

 1. Create a table of correlations between product types and product family variations.

 2. Reduce all product variations to common interfaces.

 3. Define an abstract factory interface. It must have factory methods to create each of the product types.

 4. Create concrete factory classes by implementing the abstract factory interface. There should be as many of these classes as there are variations of product families.

 5. Change the program initialization code so that it creates a specific factory and passes it to the client code.

 6. In the client code, replace the parts of creating products through the constructor with calls to the appropriate factory methods.
 */

// MARK: -  Advantages and disadvantages

/*
 + Guarantees the compatibility of created products.

 + Saves client code from binding to specific product classes.

 + Highlights product manufacturing code in one place, making it easier to maintain the code.

 + Simplifies adding new products to the program.

 + Implements the principle of openness/closeness.

 - Complicates the program code due to the introduction of many additional classes.

 - Requires the presence of all types of products in each variation.
 */
