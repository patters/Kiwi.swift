//
//  Variable.swift
//  KiwiCore
//
//  Created by Jason Patterson on 4/24/19.
//

import Foundation

public struct Variable {
    public var context: Any? { return data.context }
    public var name: String { return data.name }
    public internal(set) var value: CGFloat {
        get {
            return data.value
        }
        set {
            data.value = newValue
        }
    }

    private let data: Variable.Data
    
    public init(context: Any? = nil, name: String = "") {
        data = Variable.Data(context: context, name: name)
    }
    
    private class Data {
        let context: Any?
        let name: String
        var value: CGFloat
        
        init(context: Any?, name: String) {
            self.context = context
            self.name = name
            value = 0
        }
    }
}

extension Variable: Equatable {
    public static func ==(lhs: Variable, rhs: Variable) -> Bool {
        return lhs.data === rhs.data
    }
}

extension Variable: Hashable {
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(data).hash(into: &hasher)
    }
}

extension Variable {
    public static func *(variable: Variable, coefficient: CGFloat) -> Term {
        return Term(variable: variable, coefficient: coefficient)
    }

    public static func *(coefficient: CGFloat, variable: Variable) -> Term {
        return Term(variable: variable, coefficient: coefficient)
    }

    public static func /(variable: Variable, coefficient: CGFloat) -> Term {
        return Term(variable: variable, coefficient: CGFloat(1.0) / coefficient)
    }

    public static prefix func -(variable: Variable) -> Term {
        return Term(variable: variable, coefficient: -1.0)
    }
}
