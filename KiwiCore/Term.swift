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
