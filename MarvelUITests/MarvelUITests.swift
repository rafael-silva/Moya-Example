//
//  MarvelUITests.swift
//  MarvelUITests
//
//  Created by Rafael Silva on 06/08/2018.
//  Copyright © 2018 Rafael Silva. All rights reserved.
//

import XCTest

class MarvelUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("openHome")
    }
    
}
