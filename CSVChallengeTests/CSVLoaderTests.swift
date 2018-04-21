//
//  CSVLoaderTests.swift
//  CSVChallengeTests
//
//  Created by Carlos Fernandez Mayor on 21/04/2018.
//  Copyright © 2018 Carlos Fernandez Mayor. All rights reserved.
//

import XCTest

class CSVLoaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testCanCreate() {
        let csvLoader = CSVLoader()
        XCTAssertNotNil(csvLoader)
    }
}
