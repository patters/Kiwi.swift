//
//  ExpressionTests.swift
//  KiwiCoreTests
//
//  Created by Jason Patterson on 4/24/19.
//

import XCTest
@testable import KiwiCore

class ExpressionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicExpression() {
        let a = Variable()
        let b = Variable()
        let t1 = Term(variable: a)
        let t2 = Term(variable: b)
        let e1 = Expression(constant: 42)
        XCTAssert(e1.terms.isEmpty)
        XCTAssert(e1.constant == 42)
        let e2 = Expression(term: t1)
        XCTAssert(e2.terms == [t1])
        XCTAssert(e2.constant == 0)
        let e3 = Expression(term: t1, constant: 42)
        XCTAssert(e3.terms == [t1])
        XCTAssert(e3.constant == 42)
        let e4 = Expression(terms: [t1, t2])
        XCTAssert(e4.terms == [t1, t2])
        XCTAssert(e4.constant == 0)
        let e5 = Expression(terms: [t1, t2], constant: 42)
        XCTAssert(e5.terms == [t1, t2])
        XCTAssert(e5.constant == 42)
    }

}
