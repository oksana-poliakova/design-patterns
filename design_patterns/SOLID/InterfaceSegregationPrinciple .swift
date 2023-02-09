//
//  InterfaceSegregationPrinciple .swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation


// MARK: - Interface Segregation Principle

/* Programmatic entities should not depend on methods they do not use. This means that the interface should be broken down into smaller, more specific interfaces to reduce the amount of unnecessary code.

 Several small custom interfaces (protocols or abstract classes) are better than one big generic one.

 Even simpler: divide large interfaces into small specialized ones. */

// MARK: - Example
 
 /* Let’s have an abstract structure called Worker, and in general, we expect those who inherit from the Worker class to be able to do the eat and work tasks.

 First, let’s have a class called Human and this class inherits from the abstract structure Worker. Theoretically, we expect a person to both eat and work. Then we needed a robot structure and we inherited it from the Worker structure because the robot can work.

 The problem starts here because Worker protocol has two functions, one is work and one is eating, there is no problem for the work function because the robot can run, but since we inherit from the worker structure, we have to add the eat function as well, which causes an unnecessary responsibility to be passed to the class. This is an ISP break.
 
 protocol Worker {
     func eat()
     func work()
 }

 class Human: Worker {
     func eat() {
         print("eating")
     }

     func work() {
         print("working")
     }
 }


 class Robot: Worker {
     func eat() {
         // Robots can't eat!
         fatalError("Robots does not eat!")
     }

     func work() {
         print("working")
     }
 }
 
 In order to solve this problem, we must divide our responsibilities, which have an abstract structure, into basic parts.

 We are creating a new abstract structure called Feedable for the eat function, and the Workable abstract structure for the work function. Thus, we have divided our responsibilities.

 Now the Human class will inherit from Feeble and Workable, and the Robot class from Workable only.

 Thus, we do not impose any unnecessary responsibility on any class and we create a structure suitable for the ISP.
 */

protocol Feedable {
    func eat()
}

protocol Workable {
    func work()
}

class Human: Feedable, Workable {
    func eat() {
        print("eating")
    }

    func work() {
        print("working")
    }
}

class Robot: Workable {
    func work() {
        print("working")
    }
}

/* When a class inherits a large generic interface, it must implement all of its methods, some of which may not be needed. When a class inherits several special interfaces, it implements only those methods that it needs. */

// MARK: - How to understand that a class conforms to a principle

/* If the classes do not have unused methods or properties (variables) that are required by the protocol.
Changing the protocol changes only the required classes.
 
 This separation allows you to easily and flexibly manage interfaces and new methods will be added only to the necessary classes.

 Why follow the principle
 Following this principle helps the system to remain flexible when making changes to the logic of work and suitable for changes.
 */

// MARK: - Example 2

// Instead of this

protocol TypicalProgrammist {
    func reinstallWindows()
    func phoneRepair()
    func makeWebsite()
    func configure1C()
    func makeApp()
}

// it's better to use this structure:

// ServiceSpecialist
protocol ServiceSpecialist {
    func reinstallWindows()
    func phoneRepair()
}

class ServiceSpecialistImpl: ServiceSpecialist {
    func reinstallWindows() { }

    func phoneRepair() { }
}

// iOS developer
protocol IosDeveloper {
    func makeApp()
}

class IosDeveloperImpl: IosDeveloper {
    func makeApp() { }
}


/* Clients shouldn't depend on methods they don't use.
 
 Strive to keep interfaces concise enough so that classes don't have to implement redundant behavior. The principle of separation of interfaces says that too “thick” interfaces must be divided into smaller and more specific ones, so that clients of small interfaces know only about the methods that they need in their work.
 */

// MARK: - Example 3

protocol CloudHostingProvider {
    func createServer()
    func listServers()
}

protocol CDNProvider {
    func CDNAddress()
}

protocol CloudStorageProvider {
    func storeFile()
    func getFile()
}

class Amazon: CloudHostingProvider, CDNProvider, CloudStorageProvider {
    func createServer() { }
    
    func listServers() { }
    
    func CDNAddress() { }
    
    func storeFile() { }
    
    func getFile() { }
}

class DropBox: CloudStorageProvider {
    func storeFile() { }
    
    func getFile() { }
}
