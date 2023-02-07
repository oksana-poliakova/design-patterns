//
//  DependencyInversionPrinciple.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

// MARK: - Dependency Inversion Principle

/* DIP theoretically high-level modules should not import anything from low-level modules. Both should depend on abstractions and Abstractions should not depend on details. Details should depend on abstractions.
 
 Interaction between classes should be through interfaces or abstract classes.
 
 Classes that are final implementations should not be extended, only protocol functionality is implemented (or should be final - not inherited)
 
 struct Employee {
     func work() {
         print("working...")
     }
 }

 struct Employer {
     var employees: [Employee]

     func manage() {
         employees.forEach { employee in
             employee.work()
         }
     }
 }

 func run() {
     let employer = Employer(employees: [Employee()])
     employer.manage()
 }
 
 We have an employee structure and this structure has a work function. We also have an Employer structure and this structure enables existing employees to work.
 An employer object is created in the run function and by default, it takes the array Employee. Again, everything is fine so far, probably our project will work, but there is something we missed here. The Employer structure is directly linked to the non-abstract Employee structure. This is the point where we need the DIP.
 */


// MARK: - Example

protocol WorkableType {
    func work()
}

struct Employee: WorkableType {
    func work() {
        print("working...")
    }
}

struct Employer {
    var workables: [WorkableType]

    func manage() {
        workables.forEach { workable in
            workable.work()
        }
    }
}

func example() {
    let employer = Employer(workables: [Employee()])
    employer.manage()
}

/* Using the theoretical knowledge of DIP, we know that structures should depend on an abstract model.
 
 So, we created an abstract Workable structure and depend the Employee class to Workable so that the Employee structure retains its original functions.

 The point is that the Employer class now expects the array of the abstract struct Workable instead of the array Employee. Thus, we have linked the dependency of the Employer structure to an abstract module. This means that the Employer structure has come to the point where it can run any structure depend to the Workable module. */
