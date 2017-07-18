//
//  ChecklistsUITests.swift
//  ChecklistsUITests
//
//  Created by Tanya Tomchuk on 16.02.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import XCTest

class ChecklistsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let cells = app.tables.cells
        cells.elementBoundByIndex(0).tap()
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        
        let app = app2
        app.navigationBars["Row1"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["Checklists.AllListsView"].buttons["Add"].tap()
        
        let app2 = app
        app2.tables.cells.textFields["Name of the List"].tap()
        app2.menus.menuItems["Paste"].tap()
        app.navigationBars["Add Checklist"].buttons["Done"].tap()
        
        let app = XCUIApplication()
        let rowNavigationBar = app.navigationBars["Row"]
        rowNavigationBar.buttons["Add"].tap()
        
        let rKey = app.keys["R"]
        rKey.tap()
        rKey.tap()
        
        let tablesQuery = app.tables
        let textField = tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element
        textField.typeText("Re")
        
        let mKey = app.keys["m"]
        mKey.tap()
        mKey.tap()
        textField.typeText("mi")
        app.otherElements["Remind"].tap()
        tablesQuery.staticTexts["Apr 17, 2017, 2:56 PM"].tap()
        tablesQuery.pickerWheels["56 minutes"].tap()
        tablesQuery.switches["Remind Me"].tap()
        app.navigationBars["Add Item"].buttons["Done"].tap()
        rowNavigationBar.children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
