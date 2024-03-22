//
//  CountriesUITests.swift
//  CountriesUITests
//
//  Created by Luis Morante on 15/03/24.
//

import XCTest
@testable import Countries

final class CountriesUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
