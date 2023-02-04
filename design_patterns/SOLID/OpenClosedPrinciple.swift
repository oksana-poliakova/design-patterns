//
//  Open:Closed Principle.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 04.02.2023.
//

import Foundation

// MARK: - Open/Closed Principle

// In simple terms, Entities should be open for extension but closed for modification.

/*
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
 
 "payment: PaymentProtocol" - it's a DI, DI can be in the init or like an argument in functions
 
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
