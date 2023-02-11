//
//  TemplateSummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// MARK: - Template pattern

/*
 A template method is a behavioral design pattern that defines the skeleton of an algorithm, shifting responsibility for some of its steps to subclasses. The pattern allows subclasses to redefine the steps of an algorithm without changing its overall structure.
 
 --- Problem ---
 
 You write a data mining program in office documents. Users will upload documents in different formats (PDF, DOC, CSV) to it, and the program should extract useful information from them.

 In the first version, you were limited to processing DOC files. The next version added support for CSV. And a month later they screwed up work with PDF documents.

 At some point, you noticed that the code of all three document processing classes, although different in terms of working with files, contain quite a lot in common in terms of data extraction itself. It would be great to get rid of the re-implementation of the data extraction algorithm in each of the classes.

 In addition, the rest of the code that works with objects of these classes is filled with conditions that check the type of the handler before starting work. All this code can be simplified if all three classes are merged together or reduced to a common interface.
 
 -- Solution ---
 
 The Template Method pattern proposes to break the algorithm into a sequence of steps, describe these steps in separate methods, and call them in one template method one after another.

 This will allow subclasses to redefine some steps of the algorithm, leaving its structure and other steps unchanged, which are not so important for this subclass.
 
 --- Example from real life ---
 
 Builders use an approach similar to the template method when building typical houses. They have a basic architectural blueprint that outlines the construction steps: pouring the foundation, building walls, covering the roof, installing windows, and so on. But, despite the standardization of each stage, builders can make small changes at any of the stages to make the house a little different from the others.
 
--- Structure ---

 1. The abstract class defines the steps of the algorithm and contains a template method consisting of calls to these steps. Steps can be either abstract or contain a default implementation.

 2. A concrete class overrides some (or all) steps of the algorithm. Concrete classes do not override the template method itself.

--- Applicability ---

 1) When subclasses need to extend the base algorithm without changing its structure.

 A template method allows subclasses to extend certain steps of an algorithm through inheritance without changing the structure of the algorithms declared in the base class.

 2) When you have multiple classes doing the same thing with minor differences. If you edit one class, then you have to make the same changes to the rest of the classes. The template method pattern proposes to create a common superclass for similar classes and arrange the main algorithm in it in the form of steps. Steps that differ can be redefined in subclasses. This will remove code duplication in several classes that have similar behavior but differ in details.
 
 --- Implementation steps ---

 1. Study the algorithm and see if it can be broken down into steps. Estimate which steps will be standard for all variations of the algorithm, and which ones will change.

 2. Create an abstract base class. Define a template method in it. This method must consist of calls to the steps of the algorithm. It makes sense to make the template method final so that subclasses cannot override it (if your programming language allows it).

 3. Add methods to the abstract class for each of the steps in the algorithm. You can make these methods abstract or add some default implementation. In the first case, all subclasses will have to implement these methods, and in the second case, only if the implementation of the step in the subclass differs from the standard version.

 4. Consider introducing hooks to the algorithm. Most often, hooks are placed between the main steps of the algorithm, as well as before and after all steps.

 5. Create concrete classes by deriving from the abstract class. Implement all the missing steps and hooks in them.

--- Advantages and disadvantages ---

 + Facilitates code reuse.

 - You are severely limited to the skeleton of the existing algorithm.

 - You can violate the Barbara Liskov substitution principle by changing the basic behavior of one of the steps of the algorithm through a subclass.

 - As the number of steps increases, the template method becomes too difficult to maintain.
 */
