//
//  CurrencyFactory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 09.02.2023.
//

import Foundation

protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro : Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar : Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

enum Country {
    case UnitedStates, Spain, UK, Greece
}

enum CurrencyFactory {
    static func create(country: Country) -> Currency? {
        
        switch country {
        case .Spain, .Greece :
            return Euro()
        case .UnitedStates :
            return UnitedStatesDolar()
        default:
            return nil
        }
    }
}

func useFactory() {
    let currency = CurrencyFactory.create(country: .UK)
    currency?.code()
}
