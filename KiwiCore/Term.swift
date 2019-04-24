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
    
    public static func +(lhs: Term, rhs: Term) -> Expression {
        return Expression(termsToReduce: [[lhs], [rhs]], constant: 0)
    }
    
    public static func +(lhs: Term, rhs: Variable) -> Expression {
        return Expression(termsToReduce: [[lhs], [Term(variable: rhs)]], constant: 0)
    }
    
    public static func +(lhs: Variable, rhs: Term) -> Expression {
        return Expression(termsToReduce: [[Term(variable: lhs)], [rhs]], constant: 0)
    }
    
    public static func +(lhs: Term, rhs: CGFloat) -> Expression {
        return Expression(terms: [lhs], constant: rhs)
    }
    
    public static func +(lhs: CGFloat, rhs: Term) -> Expression {
        return Expression(terms: [rhs], constant: lhs)
    }
    
    public static func -(lhs: Term, rhs: Term) -> Expression {
        return lhs + -rhs
    }
    
    public static func -(lhs: Term, rhs: Variable) -> Expression {
        return lhs + -rhs
    }
    
    public static func -(lhs: Variable, rhs: Term) -> Expression {
        return lhs + -rhs
    }
    
    public static func -(lhs: Term, rhs: CGFloat) -> Expression {
        return lhs + -rhs
    }
    
    public static func -(lhs: CGFloat, rhs: Term) -> Expression {
        return lhs + -rhs
    }
}
