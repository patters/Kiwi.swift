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
    
    private init(termsToReduce: [[Term]], constant: CGFloat) {
        var reduced = [Variable: CGFloat]()
        for terms in termsToReduce {
            for term in terms {
                reduced[term.variable, default: 0] += term.coefficient
            }
        }
        terms = reduced.map { Term(variable: $0.key, coefficient: $0.value) }
        self.constant = constant
    }
}

extension Expression {
    public static func *(expression: Expression, coefficient: CGFloat) -> Expression {
        return Expression(terms: expression.terms.map { $0 * coefficient},
                          constant: expression.constant * coefficient)
    }

    public static func *(coefficient: CGFloat, expression: Expression) -> Expression {
        return Expression(terms: expression.terms.map { $0 * coefficient},
                          constant: expression.constant * coefficient)
    }

    public static func /(expression: Expression, coefficient: CGFloat) -> Expression {
        return Expression(terms: expression.terms.map { $0 / coefficient},
                          constant: expression.constant / coefficient)
    }

    public static prefix func -(expression: Expression) -> Expression {
        return Expression(terms: expression.terms.map { -$0},
                          constant: -expression.constant)
    }
    
    public static func +(lhs: Expression, rhs: Expression) -> Expression {
        return Expression(termsToReduce: [lhs.terms, rhs.terms],
                          constant: lhs.constant + rhs.constant)
    }
}
