//
//  ObserverPattern.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation
import UIKit

// MARK: - Observer

protocol StandartObserver: AnyObject {
    func valueChanged(valueName: String, newValue: String)
}

protocol StandartSubject: AnyObject {
    func addObserver(observer: StandartObserver)
    func removeObserver(observer: StandartObserver)
    func notifyObject()
}

// MARK: - StandartSubjectImplementation

class StandartSubjectImplementation: StandartSubject {
    private var valueName: String?
    private var newValue: String?
    
    var observerCollection = NSMutableSet()
    
    func addObserver(observer: StandartObserver) {
        self.observerCollection.add(observer)
    }
    
    func removeObserver(observer: StandartObserver) {
        self.observerCollection.remove(observer)
    }
    
    func notifyObject() {
        for observer in observerCollection {
            (observer as! StandartObserver).valueChanged(valueName: self.valueName!, newValue: self.newValue!)
            
        }
    }
    
    func changeValue(valueName:String, andValue newValue:String) {
        self.newValue = newValue
        self.valueName = valueName
        notifyObject()
    }
}

// MARK: - Observers

class SomeSubscriber: StandartObserver {
    func valueChanged(valueName: String, newValue: String) {
        print("The first browser says: Value \(valueName) changed to \(newValue)")
    }
}

class OtherSubscriber: StandartObserver {
    func valueChanged(valueName: String, newValue: String) {
        print("The second browser says: Value \(valueName) changed to \(newValue)")
    }
}

// MARK: - Add observers

func addObservers() {
    let subj = StandartSubjectImplementation()
    let oneSub = SomeSubscriber()
    let twoSub = OtherSubscriber()

    subj.addObserver(observer: oneSub)
    subj.addObserver(observer: twoSub)

    subj.changeValue(valueName: "Important value", andValue: "200")
}
