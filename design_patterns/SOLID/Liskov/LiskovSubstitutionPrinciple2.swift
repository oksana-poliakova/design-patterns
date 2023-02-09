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


/*
 1) The parameter types of the subclass method must match or be more abstract than the parameter types of the base method. Pretty confusing? Let's see how it works with an example.
 
    ◦ The base class contains a feed(Cat c) method that can feed pet cats. The client code knows this and always passes it to the cat method.
 
    ◦ Good: You have subclassed and overridden the feed method to feed any animal: feed(Animal c) . If you substitute this subclass in the client code, then nothing bad will happen. The client code will feed the cat to the method, but the method can feed all animals, so it will also feed the cat.
 
    ◦ Bad: You have created another subclass whose method can only feed Bengal cats (subclass of cats): feed(BengalCat c) . What will happen to the client code? He will still feed into the method of an ordinary cat. But the method can only feed bengals, so it will not work, breaking the client code.
 
2) The return type of the subclass method must match or be a subclass of the return value of the base method. Here everything is the same as in the previous paragraph, but vice versa. uh
    ◦ Base method: buyCat(): Cat . The client code expects any domestic cat to exit.
    ◦ Good: Subclass method: buyCat(): BengalCat . The client code will get a Bengal cat, which is a house cat, so everything will be fine.
    ◦ Bad: Subclass method: buyCat(): Animal . The client code will break because this obscure animal (maybe a crocodile) won't fit in the cat carrier.
 
 3) The method should not tighten the preconditions. For example, the base method works with an int parameter. If the subclass requires that the value of this parameter is also greater than zero, then this tightens the preconditions. Client code, which previously worked fine by feeding negative numbers into the method, will now break when working with a subclass object.
 
4) The method must not weaken the post-conditions. For example, the base method requires that all database connections be closed when the method completes, while the subclass leaves those connections open so that they can be reused later. But the base class client code doesn't know anything about it. It can terminate the program immediately after calling the method, leaving running ghost processes in the system.

5) Class invariants must remain unchanged. An invariant is a set of conditions under which an object makes sense. For example, the invariant of a cat is the presence of four paws, a tail, the ability to purr, and so on. An invariant can be described not only by an explicit contract or checks in class methods, but also indirectly, for example, by unit tests or client code.
 
 A subclass must not change the values of the private fields of the base class. This point sounds strange, but in some languages, private fields can be accessed through the reflection mechanism. In some other languages (Python, JavaScript) there is no strict protection of private fields at all.
 */
