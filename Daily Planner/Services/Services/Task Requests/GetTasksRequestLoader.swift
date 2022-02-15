//
//  GetProjectsRequestLoader2.swift
//  Daily Planner
//
//  Created by Jill Allan on 02/02/2022.
//

import Foundation

class GetTasksRequestLoader<T: Requestable> {
    let apiRequest: T // A type that conforms to APIRequest Protocol
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadRequest(category: String) async throws -> T.ResponseDataType? {
        
        // Create request
        let url = try apiRequest.createURL(category: category, id: nil)
        let urlRequest = try apiRequest.configureRequest(from: url, method: "GET")
        
        // Send request and check response
        let (responseData, response) = try await urlSession.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw RequestError.noData }
        
        // Decode data
        guard let decodedResponse = try self.apiRequest.decodeResponse(data: responseData) else {
            throw RequestError.decodingError
        }
        return decodedResponse
    }
}
