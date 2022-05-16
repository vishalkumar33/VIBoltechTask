//
//  RouterTests.swift
//  BoltechTaskTests
//
//  Created by Vishal Kumar on 14/05/22.
//

import XCTest
@testable import BoltechTask

class RouterTests: XCTestCase {

    var myDeviceNetworkManager: MyDeviceNetworkManager?
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        myDeviceNetworkManager = MyDeviceNetworkManager(router: Router(session: urlSession))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPositiveCasePictureIsReceived() {
        guard let myDeviceNetworkManager = myDeviceNetworkManager else {
            fatalError()
        }
        let responseData = TestDataHelper.getAllDeviceResponse()
        MockURLProtocol.responseData = responseData
        let expectation = XCTestExpectation(description: "response")
        myDeviceNetworkManager.getAllDeviceInfo { deviceResponse, error in
            if deviceResponse != nil {
                expectation.fulfill()
            } else {
                XCTFail()
                expectation.fulfill()
            }
        }
    }

    
    func testURLEncoding() {
        guard let url = URL(string: "https:www.google.com/") else {
            XCTAssertTrue(false, "Could not instantiate url")
            return
        }
        var urlRequest = URLRequest(url: url)
        let parameters: Parameters = [
            "UserID": 1,
            "Name": "Vishal",
            "Email": "vishal@kumara.com",
            "IsCool": true
        ]
        
        do {
            let encoder = URLParameterEncoder()
            try encoder.encode(urlRequest: &urlRequest, with: parameters)
            guard let fullURL = urlRequest.url else {
                XCTAssertTrue(false, "urlRequest url is nil.")
                return
            }
            
            let expectedURL = "https:www.google.com/?IsCool=true&UserID=1&Name=Vishal&Email=vishal%2540kumara.com"
            XCTAssertEqual(fullURL.absoluteString.sorted(), expectedURL.sorted())
        }catch {
            XCTFail()
        }
    }

}
