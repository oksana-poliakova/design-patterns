//
//  SingletonSummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// MARK: - Singleton

/* Singleton is a generational design pattern that ensures that a class has only one instance and provides a global access point to it.
 
 Problem

 A singleton solves two problems at once, violating the single responsibility principle of a class.

 1. Guarantees the existence of a single instance of the class. This is most often useful for accessing some kind of shared resource, such as a database.

 Imagine that you have created an object, and after a while you try to create another one. In this case, I would like to get the old object, instead of creating a new one.

 This behavior cannot be implemented with a normal constructor, because a class constructor always returns a new object.
 
 2. Provides a global access point. This is not just a global variable through which you can reach a specific object. Global variables are not write protected, so any code can change their values without your knowledge.
 
 Solution

 All singleton implementations boil down to hiding the default constructor and creating a public static method that controls the lifecycle of the singleton object.

 If you have access to a singleton class, then you will have access to that static method as well. From whatever point in the code you call it, it will always return the same object.
 */

// MARK: - Structure

/*
 Singleton defines a static getInstance method that returns a single instance of its class.

 If the method is static, you can access it directly.

 Singleton constructor should be hidden from clients. Calling the getInstance method should be the only way to get an object of this class.
 
 ----
 
 Applicability

 When the program must have a single instance of some class available to all clients (for example, sharing a database from different parts of the program).

 The singleton hides from clients all methods of creating a new object, except for a special method. This method either creates an object or returns an existing object if one has already been created.

 When you want to have more control over global variables. Unlike global variables, Singleton guarantees that no other code will replace the created instance of the class, so you are always sure that there is only one singleton object.

 However, at any time you can extend this limitation to allow any number of singletons by changing the code in one place (the getInstance method).
 */


// MARK: - Implementation steps

/*
 
 1. Add a private static field to the class that will contain a single object.

 2. Declare a static creation method that will be used to get the singleton.

 3. Add "lazy initialization" (creating an object the first time the method is called) to the singleton's creation method.

 4. Make the class constructor private.

 5. In client code, replace calls to the singleton constructor with calls to its creation method.
 
 ----
 
 Advantages and disadvantages

 + Ensures that there is only one instance of the class.

 + Provides a global access point to it.

 + Implements lazy initialization of a singleton object.

 - Violates the single responsibility principle of a class.

 - Disguises bad design.

 - Problems of multithreading.

 - Requires constant creation of Mock objects during unit testing.
 
 */


