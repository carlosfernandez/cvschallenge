//
//  CSVLoaderTests.swift
//  CSVChallengeTests
//
//  Created by Carlos Fernandez Mayor on 21/04/2018.
//  Copyright © 2018 Carlos Fernandez Mayor. All rights reserved.
//

import XCTest

class CSVLoaderTests: XCTestCase {
    
    let csvLoader = CSVLoader()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    
    func testLoadsFile() {
        let csvFile = try? csvLoader.rows(filename: "original.csv")
        XCTAssertNotNil(csvFile)
    }
    
    func testLoadedFileHasCorrectNumberOfRows() {
        let rows = try? csvLoader.rows(filename: "original.csv")
        XCTAssertEqual(rows?.count, 24)
    }
    
    func testThrowsWrongFilenameWhenIncorrectFilename() {
        do {
            _ = try csvLoader.rows(filename: "originalcsv")
        } catch ApplicationError.incorrectFilenameFormat {
            XCTAssert(true, "Expected error")
        } catch {
            XCTAssert(false, "Unexpected error")
        }
    }
    
    func testThrowsFileNotFoundWhenIncorrectFilename() {
        do {
            _ = try csvLoader.rows(filename: "fileNotFound.csv")
        } catch ApplicationError.fileNotFound {
            XCTAssert(true, "Expected error")
        } catch {
            XCTAssert(false, "Unexpected error")
        }
    }
}
