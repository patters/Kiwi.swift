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
}
