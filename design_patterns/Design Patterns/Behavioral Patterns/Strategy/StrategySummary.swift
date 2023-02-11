//
//  StrategySummary.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// MARK: - Strategy

/*
 A strategy is a behavioral design pattern that defines a family of similar algorithms and places each of them in its own class, after which the algorithms can be interchanged right at program execution time.

 You have decided to write a navigator app for travelers. It should show a beautiful and convenient map that makes it easy to navigate in an unfamiliar city.

 One of the most requested functions was the search and routing. Staying in an unknown city, the user should be able to specify the starting point and destination, and the navigator will lay the best path.

 The first version of your navigator could only navigate on roads, so it was great for traveling by car. But, obviously, not everyone goes on vacation by car. Therefore, the next step is to add walking routes to the navigator.

 After some time, it turned out that some people prefer to travel around the city by public transport. That's why you added this option for paving the way. But that's not all. In the near future, you would like to add cycling routes.

 And in the distant future, interesting routes for visiting sights.
 
 With each new algorithm, the code of the main class of the navigator doubled. In such a large class, it became quite difficult to navigate.

 Any change in the search algorithms, whether it was fixing bugs or adding a new algorithm, affected the main class. This increased the risk of making a mistake by accidentally hitting the rest of the running code.
 
 --- Solution ---
 
 With each new algorithm, the code of the main class of the navigator doubled. In such a large class, it became quite difficult to navigate.

 Any change in the search algorithms, whether it was fixing bugs or adding a new algorithm, affected the main class. This increased the risk of making a mistake by accidentally hitting the rest of the running code.

 The Strategy pattern proposes to define a family of similar algorithms that are often changed or extended, and put them into their own classes, called strategies.

 Instead of the original class itself executing this or that algorithm, it will act as a context, referring to one of the strategies and delegating work to it. To change the algorithm, all you need to do is substitute another strategy object into the context.

 It is important that all strategies have a common interface. Using this interface, the context will be independent of concrete policy classes. On the other hand, you can change and add new kinds of algorithms without touching the context code.
 
 --- Structure ---
 
 1. The context stores a link to the object of a specific strategy, working with it through the general strategy interface.

 2. The strategy defines an interface that is common to all variations of the algorithm. The context uses this interface to call the algorithm. For the context, it does not matter which particular variation of the algorithm will be chosen, since they all have the same interface.

 3. Specific strategies implement different variations of the algorithm.

 4. During the execution of the program, the context receives calls from the client and delegates them to the object of a particular strategy.

 5. The client must create a specific strategy object and pass it to the context constructor. In addition, the client must be able to change the strategy on the fly using a setter. Due to this, the context will not know which strategy is currently selected.
 
 --- Applicability ---

 When you need to use different variations of some algorithm within the same object. The strategy allows you to vary the behavior of an object during program execution by substituting different objects-behaviors into it (for example, those that differ in the balance of speed and resource consumption).

 When you have many similar classes that differ only in some behavior. The strategy allows you to move different behavior into a separate class hierarchy, and then reduce the original classes to one, making the behavior of this class customizable.
 
--- Implementation steps ---

 1. Define an algorithm that is subject to frequent changes. Also suitable is an algorithm that has several variations that are selected at runtime.

 2. Create a strategy interface that describes this algorithm. It should be common to all variants of the algorithm.

 3. Place variations of the algorithm in your own classes that implement this interface.

 4. In the context class, create a field to store a link to the current strategy object, as well as a method for changing it. Make sure that the context works with this object only through the general policy interface.

 5. Clients of a context must supply the appropriate policy object to it when they want the context to behave in a certain way.

 --- Advantages and disadvantages ---

 + Hot replacement of algorithms on the fly.

 + Isolates the code and data of algorithms from other classes.

 + Moving away from inheritance to delegation.

 + Implements the principle of openness/closeness.

 - Complicates the program due to additional classes.

 - The client must know what is the difference between the strategies in order to choose the right one.
 */
