//
//  TemplateCodeView.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation
import UIKit

// In Swift, we can create an abstract type to hold a blueprint of methods, and make our classes conform to it. This way we favor composition over inheritance, minimising one of the downsides of this pattern. So, we do that by declaring a Protocol.

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

// Protocols can be extended to provide method, initializer, subscript, and computed property implementations to conforming types. This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.

// Our protocol holds the three basic steps to configure views programmatically, and a fourth method setupView() that’s going to be out template.

// So we have the basic structure, but we don’t have our algorithm yet. In order to implement it, we are going to use Protocol Extensions.

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

// MARK: - Implementation

// Now we created our algorithm, in the classes that implement this protocol, setupView() is the only method that needs to be called. The other ones will hold the implementation of the algorithm steps, for example:

class MyView: UIView {

    var firstLabel = UILabel()

    var secondLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyView: CodeView {

    func buildViewHierarchy() {
        addSubview(firstLabel)
        addSubview(secondLabel)
    }

    func setupConstraints() {
    // Preferred constraint setup
    }

    func setupAdditionalConfiguration() {
        firstLabel.backgroundColor = .blue
        secondLabel.numberOfLines = 2
    }
}

// The class conforms to the protocol, and configures the steps for the algorithm. And the only method called is our template method.


