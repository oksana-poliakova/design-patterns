//
//  Open:Closed Principle.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 04.02.2023.
//

import Foundation
import UIKit

// MARK: - Open/Closed Principle

// In simple terms, Entities should be open for extension but closed for modification.

/*
 
This is a bad approach =>
 
class PaymentManager() {
    func makeCashPayment(amount: Double) {
        //perform
    }
    
    func makeVisaPayment(amount: Double) {
        //perform
    }
    
    func makeMasterCardPayment(amount: Double) {
        //perform
    }
} */

// MARK: - PaymentMethod protocol

// interface divide logic and incapsulate it
protocol PaymentMethod {
    func makePayment(amount: Double)
}

// MARK: - Payment methods we can extend

/* We also created a separate class for each Payment method, these classes will be in the abstract structure that PaymentMamager expects. So we can add as many new payment methods as we want without making any changes in the manager.
 
 CashPayment, VisaPayment, MasterCardPayment - open for extension */

// Feature #1
class CashPayment: PaymentMethod {
    func makePayment(amount: Double) { }
}

// Feature #2
class VisaPayment: PaymentMethod {
    func makePayment(amount: Double) { }
}

// Feature #3 each payment will have own method
class MasterCardPayment: PaymentMethod {
    func makePayment(amount: Double) { }
}


// MARK: - PaymentManager

/* The main task in the PaymentManager in an abstract structure (protocol), this structure will answer the requirements that PaymentManager expects.
 
 Manager help to define a type of payment
 
 "payment: PaymentProtocol" - it's a DI, DI can be in the init or like an argument in functions.
 
 So we kept our PaymentManager class open to extensions but func makePayment() closed to modifications.
*/

class PaymentManager {
    func makePayment(amount: Double, payment: PaymentMethod) {
        payment.makePayment(amount: amount)
    }
}

// MARK: - Using

class TestViewController {
    let manager = PaymentManager()
    
    func pay() {
        manager.makePayment(amount: 20, payment: VisaPayment())
    }
}

// MARK: - Explanation

/* - Program entities must be closed for changes -
 
 By clever: the source code of an entity (class, module) must remain unchanged. Interaction with an entity occurs through an interface that remains available for use in other objects.
 
 By "simple": when we subscribe to the tableView delegate in the application, we implement the UITableViewDataSource protocol with the required methods: numberOfRownInSection and cellForRowAt. We can implement them, but we cannot change their source code in any way. These protocol methods are a public interface.
 
 Or take, for example, UILabel. We work with properties: text , color or font, but we cannot change how they work "inside". Only redefine.

 This is what openness to change looks like.
 
 -  Programming entities must be open for extension -
 
 By clever: entities (classes, modules) allow you to change their behavior without changing the source code.

 In "simple" way: you can extend the behavior of an entity in Swift in three ways:

 1) Add an extension to the created entity and add new functionality there;
 2) Use inheritance and override the behavior of a method or property in a child entity (override);
 3) Use abstraction when creating entities.
 
 The role of abstraction in Swift is performed by the base class or protocol. This will allow you to combine different subclasses using polymorphism.
 */

// MARK: - How to understand that the essence corresponds to the principle

/*  If you add new behavior to the entity (calculating the area, resizing the image, or sending a request to the server) and do not have to change the code, then the entity complies with the principle of openness.
 
 If public methods are defined and the internal implementation is hidden, or the interaction occurs through a protocol or abstraction, then the entity conforms to the principle.

 All basic entities in Swift follow the open/closed principle. */


// MARK: - Simplified Openness Example

/* Working with extension
 To extend an entity, just write extension. It's easy in Swift. Let's see how it works with UIColor.

 Task: set color with RGB parameters: 63, 198, 86.
 To set the color in RGB format, you need to divide each of the numbers by 255: */

let emeraldColor = UIColor(red: 63/255, green: 198/255, blue: 86/255, alpha: 1)

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

let testColor = UIColor.rgb(r: 63, g: 198, b: 86)

// MARK: - Conclusion

/* The principle of open/closed allows you to build a system so that it can be easily scaled and not affect the work of already written parts.
 
 You don't need to think everything through in advance, and you don't need to create abstractions wherever possible. It is better to use abstractions only if it is already clear that the class will need to be extended.

 The Open/Closed Principle is a recommendation to isolate modules, because the less coupled the classes are, the easier it is to change the system as a whole.
*/

/* A class can be called public if it is extensible. For example, you can extend its set of operations or add new fields to it by creating your own subclass.
 
 At the same time, a class can be called closed (or rather, finished) if it is ready for use by other classes. This means that the class interface is already finalized and will not change in the future.
 
 If the class has already been written, approved, tested, possibly added to the library and included in the project, then it is undesirable to try to modify its contents. Instead, you can create a subclass and extend the base behavior without changing the parent class code directly.
 */
