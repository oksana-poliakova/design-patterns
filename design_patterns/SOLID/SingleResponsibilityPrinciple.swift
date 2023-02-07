//
//  Single Responsibility Principle.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 04.02.2023.
//

import Foundation

// MARK: - Single Responsibility Principle

/* Single Responsibility Principle (SRP): A class should have only one reason to change. This means that a class should only have one responsibility and be focused on doing that one thing well.
 
 Each class or type you define should have only one job to do. That doesn’t mean you can only implement one method, but each class needs to have a focused, specialized role.
 
 Handler class must not have multiple responsibilities like making a network call, parsing the response and saving into the database in the ONE class together.
 
We can solve this problem moving the responsibilities down to little classes. */


class APIHandler {
    func loadData() -> Data {
        return Data()
    }
}

class ParseHandler {
    func parse(data: Data) -> Any {
        return ""
    }
}

class StorageHandler {
    func save(model: Any) {
        //saveData
    }
}

// Store handler saves data to the local storage
class DataHandler {
    let apiHandler: APIHandler
    let parseHandler: ParseHandler
    let storageHandler: StorageHandler
    
    init(apiHandler: APIHandler, parseHandler: ParseHandler, storageHandler: StorageHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.storageHandler = storageHandler
    }
    
    // We use methods from other classes with their own responsibilities
    func handle() {
        let data = apiHandler.loadData()
        let model = parseHandler.parse(data: data)
        storageHandler.save(model: model)
    }
}

/* According to the "simple": the data persistence class must store the data, the networking class must work with the network.
 
 And: Each class (object) should have only one reason to change

 Everything is simple here: if the class has only one task, then the reason for the change will also be the same. If there is a network part in the data persistence class, then something is going wrong.
 
 Why follow the principle
 
 To make it clear at a glance what the class is doing. In order for the code to be clean, flexible, easy to maintain, the application worked predictably.
 */
