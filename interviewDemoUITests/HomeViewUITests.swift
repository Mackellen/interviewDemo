//
//  HomeViewUITests.swift
//  interviewDemoUITests
//
//  Created by Mackellen on 2020/9/27.
//  Copyright © 2020 mackellen. All rights reserved.
//

import XCTest

class HomeViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.navigationBars["测试项目"].buttons["history list"].tap()
        
        let element = app.otherElements.statusBars.children(matching: .other).element.children(matching: .other).element
        element.tap()
        app.navigationBars["历史记录"].buttons["back icon"].tap()
        
                                
    }

}
