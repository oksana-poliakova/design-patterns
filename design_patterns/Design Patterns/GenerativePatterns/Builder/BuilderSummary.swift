//
//  BuilderSummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation

// MARK: - Builder

/* The builder is a generative design pattern that allows you to create complex objects step by step. The builder makes it possible to use the same construction code to obtain different representations of objects.
 
 The Builder pattern proposes to move the construction of an object outside of its own class, entrusting this work to separate objects, called builders.
 
 The pattern proposes to break the process of constructing an object into separate steps (for example, buildWalls , insert Doors and others). To create an object, you need to call the builder methods one by one. Moreover, you do not need to run all the steps, but only those that are needed to produce an object of a certain configuration.
 
 Different builders will perform the same task in different ways.
 
 The code that calls the build steps should work with the builders through a common interface so that they can be freely interchanged.
 
 You can go a step further and separate the builder method calls into a separate class called the director. In this case, the director will set the order of the construction steps, and the builder will execute them.
 
 A separate director class is not strictly required. You can also call builder methods directly from client code. However, the director is useful if you have multiple ways of constructing products that differ in the order and presence of construction steps. In this case, you will be able to combine all this logic in one class.
 
 The Builder builds the object, and the Director knows which Builder to use to create the desired product.
 */

// MARK: - Structure

/*
 1. The builder interface declares steps for constructing products that are common to all types of builders.

 2. Individual builders implement construction steps, each in their own way. Concrete builders can produce heterogeneous objects that do not share a common interface.

 3. Product - the object being created. Products made by different builders are not required to have a common interface.

 4. The director determines the order in which construction steps are called for the production of a particular product configuration.

 5. Usually, the Client submits a ready-made builder object to the director's constructor, and in the future, this director uses only it.
 */

// MARK: - Usage

/*
 The Builder pattern lets you build objects step by step, calling only the steps you need.

 This means that you no longer need to try to insert all possible product options into the constructor. When your code needs to create different representations of some object. For example, wooden and iron houses.

 The builder can be used if the creation of several representations of an object consists of the same steps that differ in details. The builder interface will define all possible construction steps. Each view will have its own builder class. And the order of the construction stages will be set by the class director.
 */

// MARK: -  Implementation steps

/*
 1. Make sure that creating different representations of an object can be reduced to common steps.

 2. Describe these steps in the common builder interface.

 3. For each representation of the product object, create one builder class and implement their builder methods. Don't forget about the method for getting the result. Usually, specific builders determine their own methods for obtaining the result of construction. You cannot describe these methods in a builder interface because products do not have to share a common base class or interface. But you can always add a getter method to the common interface if your builders produce homogeneous products with a common ancestor.

 4. Consider creating a director class. Its methods will create different product configurations by calling different steps of the same builder.

 5. The client code will need to create both the builder objects and the director object. Before starting construction, the client must associate a specific builder with the director. This can be done either through a constructor, through a setter, or by feeding the builder directly into the director's construction method. 6. The result of the construction can be returned from the director, but only if the method of returning the product could be placed in the general interface of the builders. Otherwise, you will hard-wire the director to specific builder classes.
 */

// MARK: -  Advantages and disadvantages

/*
 + Allows you to create products step by step.

 + Allows you to use the same code to create different products.

 + Isolates complex product assembly code from its core business logic.

 - Complicates the program code due to the introduction of additional classes.

 - The client will be tied to specific builder classes, since the director's interface may not have a method for getting the result.
 */
