//
//  HouseBuilder.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation

// MARK: - Models

struct Walls {
    var width: Float
    var height: Float
}

struct Roof {
    var width: Float
    var height: Float
}

struct House {
    var walls: Walls?
    var roof: Roof?
}

// MARK: - Builder

class HouseBuilder {
    private var house: House?
    func setValue(walls: Walls?, roof: Roof?) {
        house?.walls = walls
        house?.roof = roof
    }
    
    func getResult() -> House? {
        return house
    }
}

// MARK: - Usage

func getResultOfHouseBuilder() {
    let walls = Walls(width: 1.5, height: 2.30)
    let roof = Roof(width: 2.5, height: 3.30)
    let builder = HouseBuilder()
    builder.setValue(walls: walls, roof: roof)
    let house = builder.getResult()
}


