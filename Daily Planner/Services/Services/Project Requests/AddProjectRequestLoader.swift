//
//  AddProjectRequestLoader2.swift
//  Daily Planner
//
//  Created by Jill Allan on 02/02/2022.
//

import Foundation

class AddProjectRequestLoader<T: Requestable> {
    let apiRequest: T // A type that conforms to APIRequest Protocol
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadRequest(category: String, with requestData: T.RequestDataType) async throws -> T.ResponseDataType? {
        
        // Create request
        let url = try apiRequest.createURL(category: category, id: nil)
        let urlRequest = try apiRequest.makeRequest(from: url)

        // Encode data
        guard let encoded = try apiRequest.encodeData(from: requestData) else { return nil }
        
        // Send request and check response
        let (responseData, response) = try await urlSession.upload(for: urlRequest, from: encoded)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw RequestError.noData }
        
        // Decode data
        guard let decodedResponse = try self.apiRequest.decodeResponse(data: responseData) else {
            throw RequestError.decodingError
        }
        return decodedResponse
    }
}
