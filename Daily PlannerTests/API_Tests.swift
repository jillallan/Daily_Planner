//
//  Daily_PlannerTests.swift
//  Daily PlannerTests
//
//  Created by Jill Allan on 31/01/2022.
//

import XCTest
@testable import Daily_Planner

class API_Tests: XCTestCase {
    
    var requestLoader: GetTasksRequestLoader<GetProjectsRequest>!
    let request = GetProjectsRequest()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        requestLoader = GetTasksRequestLoader(apiRequest: request, urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPIRequest_whenMakingRequest_shouldGiveCorrectURLParameters() throws {

        let url = URL(string: "https://api.todoist.com/rest/v1/projects")
        
        let urlRequest = try request.configureRequest(from: url!)
        
        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "api.todoist.com")
    }
    
    func testAPIRequest_whenParsing_shouldDecodeCorrectly() throws {
        let jsonData = "[{\"id\": 2074487666,\"name\": \"Inbox\"}]".data(using: .utf8)!
        
        if let response = try request.decodeResponse(data: jsonData) {
            XCTAssertEqual(response.count, 1)
            XCTAssertEqual(response[0].name, "Inbox")
        }
    }

    func testAPIRequest_whenLoadingRequest_shouldGiveCorrectResponse() async throws {
        let jsonData = "[{\"id\": 2074487666,\"name\": \"Inbox\"}]".data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in

            XCTAssertEqual(request.url?.host?.contains("api.todoist.com"), true)
            return (HTTPURLResponse(), jsonData)
        }
        
        let projects = try await requestLoader.loadRequest(category: "projects")
        XCTAssertEqual(projects![0].name, "Inbox")
        
    }
    
}
