//
//  VariableTests.swift
//  KiwiCoreTests
//
//  Created by Jason Patterson on 4/24/19.
//

import XCTest
@testable import KiwiCore

class VariableTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicVariable() {
        let a = Variable()
        let b = Variable()
        let c = Variable(name: "c")
        let context = 42
        let d = Variable(context: context, name: "d")
        
        XCTAssert(a.name.isEmpty)
        XCTAssert(a != b)
        XCTAssert(a == a)
        XCTAssertNil(a.context)
        XCTAssert(c.name == "c")
        XCTAssertNotNil(d.context)
        XCTAssert((d.context as! Int) == context)
        XCTAssert(a.value == 0)
        
        var set = Set<Variable>()
        set.insert(a)
        set.insert(b)
        set.insert(c)
        set.insert(d)
        set.insert(a)
        set.insert(b)
        set.insert(c)
        set.insert(d)
        XCTAssert(set.count == 4)
    }
    
    func testVariableOperations() {
        let a = Variable()
        let t1 = a * 2.0
        XCTAssert(t1.variable == a)
        XCTAssert(t1.coefficient == 2)
        let t2 = 2.0 * a
        XCTAssert(t2.variable == a)
        XCTAssert(t2.coefficient == 2)
        let t3 = a / 2.0
        XCTAssert(t3.variable == a)
        XCTAssert(t3.coefficient == 0.5)
        let t4 = -a
        XCTAssert(t4.variable == a)
        XCTAssert(t4.coefficient == -1.0)
    }
}
