//
//  RequestLoader.swift
//  Daily Planner
//
//  Created by Jill Allan on 15/02/2022.
//

import Foundation

class RequestLoader<T: Requestable> {
    let apiRequest: T // A type that conforms to APIRequest Protocol
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadRequest(category: String, id: Int?, with requestData: T.RequestDataType?, method: String = "GET") async throws -> T.ResponseDataType? {
//    func loadRequest(category: String, with requestData: T.RequestDataType?, method: String = "GET") async throws -> T.ResponseDataType? {
        
        // Create request
        let url = try apiRequest.createURL(category: category, id: id)
//        let url = try apiRequest.createURL(category: category, id: nil)
        let urlRequest = try apiRequest.configureRequest(from: url, method: method)

        // Encode data
        if method == "POST" {
            if let requestData = requestData {
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
        let (responseData, response) = try await urlSession.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw RequestError.noData }
        
        // Decode data
        guard let decodedResponse = try self.apiRequest.decodeResponse(data: responseData) else {
            throw RequestError.decodingError
        }
        return decodedResponse
    }
    
}

//        let requestData = try networkRequest.encodeData(from: data)
//        let url = try networkRequest.createURL(category: category, id: nil)
//        let request = try networkRequest.createRequest(from: url)
//        let (data, response) = try await urlSession.upload(for: request, from: requestData)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw RequestError.noData }
//        return try JSONDecoder().decode(responseDataType, from: data)
