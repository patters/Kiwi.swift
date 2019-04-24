//
//  TermTests.swift
//  KiwiCoreTests
//
//  Created by Jason Patterson on 4/24/19.
//

import XCTest
@testable import KiwiCore

class TermTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicTerm() {
        let a = Variable(name: "a")
        let t1 = Term(variable: a)
        let t2 = Term(variable: a, coefficient: 42)
        XCTAssert(t1.coefficient == 1.0)
        XCTAssert(t2.coefficient == 42.0)
        XCTAssert(t1.variable == a)
        XCTAssert(t2.variable == a)
    }
}
