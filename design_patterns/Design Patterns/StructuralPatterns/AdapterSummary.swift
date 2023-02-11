//
//  AdapterSummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// MARK: - Adapter

/* An adapter is a structural design pattern that allows objects with incompatible interfaces to work together.
 
 You can create an adapter. This is a translator object that transforms the interface or data of one object in such a way that it becomes understandable to another object. In this case, the adapter wraps one of the objects, so that the other object does not even know about the presence of the first.

 For example, you can wrap an object that works in meters with an adapter that converts the data to feet. Adapters can not only translate data from one format to another, but also help objects with different interfaces work together.
 
 Example: XML_To_JSON_Adapter

 It works like this:

 1. The adapter has an interface that is compatible with one of the objects.

 2. Therefore, this object is free to call adapter methods.

 3. The adapter receives these calls and redirects them to the second object, but in the format and sequence that the second object understands. Sometimes it is even possible to create a double-sided adapter that would work both ways.
 */

// MARK: - Structure

/*

 Object adapter This implementation uses aggregation: the adapter object "wraps", that is, contains a reference to the service object.

 1. The client is a class that contains the existing business logic of the program.

 2. The client interface describes the protocol through which the client can work with other classes.

 3. Service is some useful class, usually third-party. The client cannot use this class directly, because the service has an interface that it does not understand.

 4. An adapter is a class that can work with both the client and the service at the same time. It implements the client interface and contains a reference to the service object. The adapter receives calls from the client through methods on the client interface and then translates them into method calls on the wrapped object in the correct format.

 5. Working with the adapter through the interface, the client is not tied to a specific adapter class. Thanks to this, you can add new types of adapters to the program, regardless of the client code. This can be useful if the service interface suddenly changes, for example, after a new version of a third-party library is released.
 
 ----
 
 Applicability

 When you want to use a third party class but its interface doesn't match the rest of the application code.

 The adapter allows you to create a wrapper object that will turn application calls into a format that a third-party class understands.

 When you need to use several existing subclasses, but they lack some common functionality, and you cannot extend the superclass.
 
 */

// MARK: - Implementation steps

/*
 
 1. Make sure you have two classes with incompatible interfaces:
 ◦ useful service - a utility class that you cannot change (it is either third-party or other code depends on it); ◦ one or more clients—existing application classes that are incompatible with the service because of an awkward or mismatched interface.

 2. Describe the client interface through which application classes could use the service class.

 3. Create an adapter class by implementing this interface.

 4. Place a field in the adapter that will store a reference to the service object. Typically, this field is populated with the object passed to the adapter's constructor. In the case of a simple adaptation, this object can be passed through the parameters of the adapter methods.

 5. Implement all client interface methods in the adapter. The adapter must delegate most of the work to the service.

 6. The application must only use the adapter through the client interface. This will make it easy to change and add adapters in the future.
 
 ----
 
 Advantages and disadvantages

 + Separates and hides from the client the details of the conversion of various interfaces.

 - Complicates the program code due to the introduction of additional classes.
 
 */
