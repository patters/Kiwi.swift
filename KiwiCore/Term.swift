//
//  Term.swift
//  KiwiCore
//
//  Created by Jason Patterson on 4/24/19.
//

import Foundation

public struct Term: Hashable {
    let variable: Variable
    let coefficient: CGFloat
    
    public init(variable: Variable, coefficient: CGFloat = 1.0) {
        self.variable = variable
        self.coefficient = coefficient
    }
}

extension Term {
    public static func *(term: Term, coefficient: CGFloat) -> Term {
        return Term(variable: term.variable, coefficient: term.coefficient * coefficient)
    }

    public static func *(coefficient: CGFloat, term: Term) -> Term {
        return Term(variable: term.variable, coefficient: term.coefficient * coefficient)
    }

    public static func /(term: Term, coefficient: CGFloat) -> Term {
        return Term(variable: term.variable, coefficient: term.coefficient / coefficient)
    }

    public static prefix func -(term: Term) -> Term {
        return Term(variable: term.variable, coefficient: -term.coefficient)
    }
}
