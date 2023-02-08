//
//  SummaryDesignPatterns.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Summary Design Patterns

/* A design pattern is a common solution, general solution concept to a particular problem in software architecture design.

What does a pattern consist of?

 • the problem that the pattern solves;
 • motivation to solve the problem in a way that lags the pattern;
 • structures of the classes that make up the solution;
 • an example in one of the programming languages;
 • features of implementation in various contexts;
 • connections with other patterns.
 
 Pattern classification
 
 • Generative patterns worry about flexible creation objects without introducing unnecessary dependencies into the program.
 • Structural patterns show different ways building links between objects.
 • Behavioral patterns take care of effective communication connections between objects.
 
 Qualities of good architecture
 
 • Code reuse
 • Expandability
 
 */

// MARK: - Basic Design Principles

/*
 
 • Encapsulate what changes
 
 Identify the aspects of a program, class, or method that change most often, and separate those from what remains constant.
 
 • Program at the interface level
 
Program at the interface level, not at the implementation level. Code should depend on abstractions, not concrete classes.
 
 • Prefer composition over inheritance
 
 Если наследование можно выразить словом «является» (автомобиль является транспортом), то композицию — словом «содержит» (автомобиль содержит двигатель).
 
 1) Подкласс не может отказаться от интерфейса или реализации своего родителя. Вы должны будете реализовать все абстрактные методы родителя, даже если они не нужны для конкретного подкласса.

 2) Переопределяя методы родителя, вы должны заботиться о том, чтобы не сломать базовое поведение суперкласса. Это важно, ведь подкласс может быть использован в любом коде, работающим с суперклассом.

 3) Наследование нарушает инкапсуляцию суперкласса, так как подклассам доступны детали родителя. Суперклассы могут сами стать зависимыми от подклассов, например, если программист вынесет в суперкласс какие-то общие детали под- классов, чтобы облегчить дальнейшее наследование.

 4) Подклассы слишком тесно связаны с родительским классом. Любое изменение в родителе может сломать поведение в подклассах.

 5) Повторное использование кода через наследование может привести к разрастанию иерархии классов.
 
 -----------------------
 
 If inheritance can be expressed by the word “is” (the car is a transport), then composition can be expressed by the word “contains” (the car contains the engine).
  
 1) A subclass cannot drop the interface or implementation of its parent. You will need to implement all abstract methods on the parent, even if they are not needed by the concrete subclass.

 2) When overriding methods on the parent, you must be careful not to break the underlying behavior of the superclass. This is important because the subclass can be used in any code that works with the superclass.

 3) Inheritance breaks the encapsulation of the superclass, since the details of the parent are available to the subclasses. Superclasses can themselves become dependent on subclasses, for example, if the programmer moves some common details of subclasses into the superclass to facilitate further inheritance.

 4) Subclasses are too closely related to the parent class. Any change in the parent can break behavior in subclasses.

 5) Reuse of code through inheritance can lead to the growth of the class hierarchy.
 
 */


