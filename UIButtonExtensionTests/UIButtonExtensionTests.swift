//
//  UIButtonExtensionTests.swift
//  UIButtonExtensionTests
//
//  Created by Arman Zoghi on 9/28/20.
//

import XCTest
@testable import UIButtonExtension

class UIButtonExtensionTests: XCTestCase {
    
    var radioButton: UIRadioButton!
    var checkBoxModern: UICheckboxModern!
    var checkBoxClassic: UICheckboxClassic!

    override func setUpWithError() throws {
        radioButton = UIRadioButton()
        checkBoxModern = UICheckboxModern()
        checkBoxClassic = UICheckboxClassic()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
