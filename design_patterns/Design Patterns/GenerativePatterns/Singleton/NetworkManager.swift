//
//  NetworkManager.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetch() {
        let url = URL(string: "some_url")
    }
}

func testNetworkManager() {
    NetworkManager.shared.fetch()
}
