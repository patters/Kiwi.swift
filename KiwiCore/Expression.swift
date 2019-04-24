//
//  Expression.swift
//  KiwiCore
//
//  Created by Jason Patterson on 4/24/19.
//

import Foundation

public struct Expression {
    let terms: [Term]
    let constant: CGFloat
    
    init(constant: CGFloat = 0) {
        terms = []
        self.constant = constant
    }
    
    init(term: Term, constant: CGFloat = 0) {
        terms = [term]
        self.constant = constant
    }
    
    init(terms: [Term], constant: CGFloat = 0) {
        self.terms = terms
        self.constant = constant
    }
}
