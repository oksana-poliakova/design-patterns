//
//  Summary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

/* Object-oriented programming is a programming methodology in which all the important things represented by objects, each of which is an instance of a particular class, and classes form inheritance hierarchy.
 
 Objects are instances of classes.
 
 Interface - public part of an object that is accessible to other objects.  Classes follow an interface means that they inherit the same protocol. Subclasses always follow the interface of the parent class. You cannot exclude from a subclass a method declared in its parent.
 
 In most object programming languages, a class can have only one parent. But, on the other hand, a class can implement several interfaces at the same time.
 
 Basic principles of OOP:

 1. Encapsulation is the practice of keeping the internal representation of an object secret from external objects. For interaction, public methods are created to access and manipulate data. This helps prevent unauthorized access to data and makes code easier to maintain.
 
    Encapsulation is the ability of objects to hide part of their state and behavior from other objects, providing the outside world with only a certain interface for interacting with themselves.
 
    For example, you can encapsulate something within a class by making it private and hiding access to that field or method from objects of other classes.
 
 2. Abstraction is the practice of hiding the complex implementation details of an object and providing the outside world with only the necessary information. This allows the object to be used without the user having to understand how it works.
 
 3. Inheritance is a mechanism that allows you to create a new class based on an existing class. The new class inherits all the properties and behaviors of the base class and can add or override methods to provide additional functionality.
 
 4. Polymorphism is the ability of an object to take on multiple forms. This can be achieved through inheritance, where different subclasses can be treated as objects of the same type, or through method overriding, where a subclass can provide a different implementation of a method inherited from the base class.
 
    Polymorphism is the ability of a program to choose different implementations when calling operations with the same name.
 
 5. Composition is a form of object-oriented design in which objects are created from other objects. This allows you to combine objects to create more complex objects, allowing you to reuse existing code and create systems with greater modularity and flexibility.

 Thus, the basic principles of OOP are encapsulation, abstraction, inheritance, polymorphism, and composition, which allow you to create reusable, modular, and maintainable code by organizing it into objects with specific behavior and data.
 */


/* Aggregation is a specialized kind of association that describes one-to-many, many-to-many, part-to-whole relationships between multiple entities. The department contains professors.
 
 Usually, when aggregating, one object contains others, i.e. acts as a container or collection.
 
 Composition is a stricter version of aggregation when one object is made up of others. The university consists of departments.
 */


/*
 • Зависимость: Класс А могут затронуть изменения в классе B.
 • Ассоциация: Объект А знает об объекте B. Класс А зависит от B.
 • Агрегация: Объект А знает об объекте B и состоит из него. Класс А зависит от B.
 • Композиция: Объект А знает об объекте B, состоит из него и управляет его жизненным циклом. Класс А зависит от B.
 • Реализация: Класс А определяет методы объявленные интерфейсом B. Объекты А можно рассматривать через интерфейс B. Класс А зависит от B.
 • Наследование: Класс А наследует интерфейс и реализацию класса B, но может переопределить её. Объекты А можно рассматривать через интерфейс класса B. Класс А зависит от B.
 
 • Dependency: Class A may be affected by changes to class B.
 • Association: Object A knows about object B. Class A depends from b.
 • Aggregation: Entity A knows about and consists of entity B. Class A depends on B.
 • Composition: Object A knows about object B, consists of it and manages its life cycle. Class A depends on B.
 • Implementation: Class A defines methods declared by interface B. Objects of A can be viewed through interface B. Class A depends on B.
 • Inheritance: Class A inherits the interface and implementation of class B, but can override it. Objects A can be viewed through the interface of class B. Class A depends on B.
 */
