//
//  ThemeBuilder.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 10.02.2023.
//

import Foundation
import UIKit

struct Theme {
    let textColor: UIColor?
    let backgroundColor: UIColor?
}

class ThemeBuilder {

    enum Style {
        case light
        case dark
    }

    func build(_ style: Style) -> Theme {
        switch style {
        case .light:
            return Theme(textColor: .black, backgroundColor: .white)
        case .dark:
            return Theme(textColor: .white, backgroundColor: .black)
        }
    }
}

let builder = ThemeBuilder()
let light = builder.build(.light)
let dark = builder.build(.dark)
