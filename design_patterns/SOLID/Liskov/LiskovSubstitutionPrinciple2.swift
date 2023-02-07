//
//  LiskovSubstitutionPrinciple2.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 07.02.2023.
//

import Foundation
import UIKit

// 1. Define a protocol for everything that can be drawn with.

protocol Drawing {
    var color: UIColor { get }
}

// 2. Define subclasses. Pen class.
class Pen: Drawing {
    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
}

// Pencil class.
class Pencil: Drawing {
    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
}

// 3. A Child class that can draw anything that can draw.
class Child {
    func drawHouse(with item: Drawing) {
        print("House color: ", item.color)
    }
}

// MARK: - Functions that use a base type must be able to use subtypes of the base type without knowing it.

/* The main idea is that we can give the child any object that can draw (inherited from the Drawing protocol) and the child will be able to draw with it. */

class DrawViewController {
    // Instances of classes: Pencil, Pen and Child.
    let bluePen = Pen(color: .blue)
    let blackPencil = Pencil(color: .black)
    let bob = Child()

    func check() {
        // Check the child Bob Can Draw With Pens And Pencils
        bob.drawHouse(with: bluePen)        // House color: blue
        bob.drawHouse(with: blackPencil)    // House color: black
    }
}
