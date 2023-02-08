//
//  Protocols.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation

protocol CatsFood {
    var kcal: Int { get set }
    func energy()
}

protocol Food {
    func getNutrition()
}

protocol Sausage {
    func getColor()
    func getNutrition()
    func getExpiration()
}

class CatFood: CatsFood, Sausage {
    var kcal: Int
    
    init(kcal: Int) {
        self.kcal = kcal
    }
    
    func energy() {
        
    }
    
    func getColor() {
        
    }
    
    func getNutrition() {
        
    }
    
    func getExpiration() {
        
    }
}
