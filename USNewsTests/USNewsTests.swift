//
//  USNewsTests.swift
//  USNewsTests
//
//  Created by D&C Dev on 25/08/2021.
//

import XCTest
@testable import USNews

class USNewsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiCall() {
        let expectation = XCTestExpectation.init(description: "Expect to get response data")
        let url = URL(string: UrlDirectory.getMostViewedApi())!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
          
                XCTFail(error.localizedDescription)
            } else {
                
                XCTAssert(true, "Api Returened Success")
            }
        }.resume()
        
        // The request is finished, so our expectation full filled
        expectation.fulfill()
        
        self.tearDown()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            testApiCall()
        }
    }
    
    func testUrlQuery() {
        let days = 7 // when u change this change the number in test url after view
            /// API End Point
            enum Endpoint: String {
                // Popular News Api
                case popularNewsApi = "svc/mostpopular/v2/viewed/"
            }
        
        let closingParam = "\(UrlDirectory.apiHeader)=\(UrlDirectory.apiKey)"
        let link   = "\(UrlDirectory.baseUrl)\(Endpoint.popularNewsApi.rawValue)\(days).json?\(closingParam)"
        XCTAssertEqual(link, "http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=RV2Ggx4ixFPyAM4MV3fnwr21Qfwpt1A9")
    }

}
