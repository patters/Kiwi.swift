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
}
