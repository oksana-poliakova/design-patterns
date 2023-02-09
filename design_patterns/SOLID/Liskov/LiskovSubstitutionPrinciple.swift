//
//  LiskovSubstitutionPrinciple.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 04.02.2023.
//

import Foundation
import UIKit

// MARK: - Liskov Substitution Principle

/* Objects should be replaced with instances of their subclasses without changing the behavior.
 Or with other words: derived classes should replace their base classes without any problems.
 
 Subclasses should complement, not replace, the behavior of the base class.
 */

/* This is a bad approach
 
 class Rectangle {

     var witdh: Float = 0
     var height: Float = 0

     func set(witdh: Float) {
         self.witdh = witdh
     }

     func set(height: Float) {
         self.height = height
     }

     func calculateArea() -> Float {
         return witdh * height
     }

 }

 class Square: Rectangle {

     override func set(witdh: Float) {
         self.witdh = witdh
         self.height = witdh
     }

     override func set(height: Float) {
         self.height = height
         self.witdh = witdh
     }
 }

 //breaks the lsp
 func setSizeAndPrint(of rectangle: Rectangle) {
     rectangle.set(height: 5)
     rectangle.set(witdh: 4)
     print(rectangle.calculateArea())
 }

 func example() {
     let rectangle = Rectangle()
     setSizeAndPrint(of: rectangle)

     let square = Square()
     setSizeAndPrint(of: square)
 }
 */


/* As in the example above, the common task between the Rectangle and Square classes is to calculate the area of the object. Both the rectangle and square classes inherit the Polygon abstract structure after this task is defined in a common protocol. Each class fulfills the necessary tasks within itself and there is no need to make any special developments. Classes behave just like the structure they inherit.
 */

protocol Polygon {
    func calculateArea() -> Float
}

class Rectangle: Polygon {

    var witdh: Float = 0
    var height: Float = 0

    func set(witdh: Float) {
        self.witdh = witdh
    }

    func set(height: Float) {
        self.height = height
    }

    func calculateArea() -> Float {
        return witdh * height
    }
}

class Square: Polygon {

    var side: Float = 0

    func set(side: Float) {
        self.side = side
    }

    func calculateArea() -> Float {
        return pow(side,2)
    }
}

class TestVC: UIViewController {
    func printArea(polygon: Polygon) {
        print(polygon.calculateArea())
    }

    func example() {
        let rectangle = Rectangle()
        rectangle.set(witdh: 4)
        rectangle.set(height: 5)
        print(printArea(polygon: rectangle))

        let square = Square()
        square.set(side: 4)
        printArea(polygon: square)
    }
}
