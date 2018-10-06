//
//  MarvelUITest.swift
//  MarvelUITests
//
//  Created by Rafael Silva on 22/09/2018.
//  Copyright © 2018 Rafael Silva. All rights reserved.
//

import XCTest

class MarvelUITest: XCTestCase {
    
    func testExample() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("openHome")
    }
    
}
