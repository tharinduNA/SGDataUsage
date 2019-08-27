//
//  SGDataUsageTests.swift
//  SGDataUsageTests
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import XCTest
@testable import SGDataUsage

class SGDataUsageTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApiEndPoint() {
        let urlString = Constants.END_POINT
        XCTAssertEqual(urlString, "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=100")
    }
    
    func testNoNetworkMessages() {
        XCTAssertEqual(Constants.NO_NETWORK_TITLE, "No Internet")
        XCTAssertEqual(Constants.NO_NETWORK_MESSAGE, "Make sure you are connected to Internet")
    }


}
