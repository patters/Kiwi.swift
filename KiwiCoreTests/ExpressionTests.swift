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
    
    func testExpressionOperations() {
        let a = Variable()
        let t = Term(variable: a, coefficient: 2)
        let e = Expression(term: t, constant: 42)

        let e1 = e * 2.0
        XCTAssertEqual(e1.terms, [Term(variable: a, coefficient: 4)])
        XCTAssertEqual(e1.constant, 84)
        let e2 = 2.0 * e
        XCTAssertEqual(e2.terms, [Term(variable: a, coefficient: 4)])
        XCTAssertEqual(e2.constant, 84)
        let e3 = e / 2.0
        XCTAssertEqual(e3.terms, [Term(variable: a, coefficient: 1)])
        XCTAssertEqual(e3.constant, 21)
        let e4 = -e
        XCTAssertEqual(e4.terms, [Term(variable: a, coefficient: -2)])
        XCTAssertEqual(e4.constant, -42)
    }
    
    func testExpressionOperations2() {
        let a = Variable()
        let t1 = Term(variable: a, coefficient: 2)
        let e1 = Expression(term: t1, constant: 42)

        let b = Variable()
        let t2 = Term(variable: b, coefficient: 2)
        let e2 = Expression(term: t2, constant: 1)

        let e3 = e1 + e1
        XCTAssertEqual(e3.terms, [Term(variable: a, coefficient: 4)])
        XCTAssertEqual(e3.constant, 84)
        let e4 = e1 + e2
        XCTAssertEqual(Set(e4.terms), Set([t1, t2]))
        XCTAssertEqual(e4.constant, 43)
        let e5 = e2 + e1
        XCTAssertEqual(Set(e5.terms), Set([t1, t2]))
        XCTAssertEqual(e5.constant, 43)
    }
}
