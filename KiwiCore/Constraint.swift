//
//  Constraint.swift
//  KiwiCore
//
//  Created by Jason Patterson on 4/24/19.
//

import Foundation

public class Constraint {
    
    public enum Relation {
        case lessThanOrEqual
        case equal
        case greaterThanOrEqual
    }
    
    public struct Strength: RawRepresentable {
        public typealias RawValue = CGFloat
        public let rawValue: CGFloat
        
        static let required = Strength()
        
        public init(rawValue: CGFloat) {
            self.rawValue = max(0, min(rawValue, Strength.required.rawValue))
        }
        
        init() {
            rawValue = 1000.0
        }
    }
    
    public let expression: Expression
    public let relation: Relation
    public let strength: Strength
    
    public init(expression: Expression, relation: Relation, strength: Strength) {
        self.expression = expression
        self.relation = relation
        self.strength = strength
    }
}

extension Constraint: Equatable {
    public static func ==(lhs: Constraint, rhs: Constraint) -> Bool {
        return lhs === rhs
    }
}

extension Constraint: Hashable {
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(self).hash(into: &hasher)
    }
}
