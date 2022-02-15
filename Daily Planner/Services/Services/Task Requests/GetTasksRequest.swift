//
//  GetTasksRequestLoader.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import Foundation

struct GetTasksRequest: Requestable {
    
    // Can I make this use a generic input
    func encodeData(from data: [TodoTask]) throws -> Data? {
        return nil
    }
    
    // Can I separate this out as duplicated in Get Projects request
    func createURL(category: String, id: Int?) throws -> URL {
        var url = URL(string: Constants.apiAddress)
        url?.appendPathComponent(category)
        
        if let id = id { url?.appendPathComponent(String(id)) }
        guard let url = url else { throw RequestError.cannotCreateURL }
        return url
    }
    
    // Can I separate this out as duplicated in Get Projects request
    func configureRequest(from url: URL, method: String = "GET") throws -> URLRequest {
        var request = URLRequest(url: url)
        
        guard let token = Constants.token else { throw RequestError.apiKeyError }
        
        print(token)
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    // Can I use a generic input and opaque return type
    func decodeResponse(data: Data) throws -> [TodoTask]? {
        return try JSONDecoder().decode([TodoTask].self, from: data)
    }
}
