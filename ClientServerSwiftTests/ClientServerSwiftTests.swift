//
//  ClientServerSwiftTests.swift
//  ClientServerSwiftTests
//
//  Created by Vlad Gershun on 11/16/21.
//

import XCTest
@testable import ClientServerSwift

class ClientServerSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let clientSocket = ClientSocket(host: "localhost", port: "49999")
        let sockedfd = try clientSocket.connect()
        let message = try sockedfd.readLine()
        // Tue Nov 23 19:47:5
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM dd kk:mm:ss"
        formatter.timeZone = .current
//        formatter.locale =
        formatter.calendar = .init(identifier: .gregorian)
        let expected = String(formatter.string(from: date).dropLast()) + "\n"
        
        XCTAssertEqual(message, expected)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
