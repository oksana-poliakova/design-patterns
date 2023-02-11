//
//  TaskAdapter.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

// Let’s assume that we would like to build an app to manage tasks from our tasks manager tool. We got an API structure that looks like this:

struct APITask: Decodable {
    let id: String
    let createdAt: TimeInterval
    let createdBy: String
    let developedBy: String
    let finishedAt: TimeInterval?
}

// But inside the app, we would like to not rely on the API models, so we need to adopt this object using some protocol (or wrapper). We want to decouple the model layer from view model layer.

protocol Task {
    var id: String { get }
    var createdAtDate: Date { get }
    var author: String { get }
    var finishedAtDate: Date? { get }
}

// And last, but not least we need to adapt APITask to conform to Task protocol:

extension APITask: Task {
    var author: String { return createdBy }
    var createdAtDate: Date { return Date(timeIntervalSince1970: createdAt) }
    var finishedAtDate: Date? { return finishedAt.map { Date(timeIntervalSince1970: $0) } }
}

// In this example, the APITask extension adapts the APITask concrete object to the generic Task protocol. Now, any class that deals with a generic object conforming to Task (for instance, a view), can deal with an APITask as well, without even realizing it does so. The main benefit here is that we completely decoupled that class (e.g. a view controller) from the model layer (APITask).


