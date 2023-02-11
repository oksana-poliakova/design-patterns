//
//  FileManager.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

class FileManager {
    
    // create a singleton
    static let fileObj = FileManager()
    
    // create a private initializer
    private init() { }
    
    // method to request file
    func checkFileAccess(user: String) {
        
        // condition to check username
        if user == ("@user") {
            print("Access Granted")
        }
        else {
            print(" Access Denied")
        }
    }
}

func checkAccess() {
    let userName = "@user"

    // access method
    let file = FileManager.fileObj

    file.checkFileAccess(user: userName)
}

