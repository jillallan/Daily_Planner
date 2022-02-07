//
//  AddProjectRequest2.swift
//  Daily Planner
//
//  Created by Jill Allan on 02/02/2022.
//

import Foundation

struct AddProjectRequest: Requestable {
    
    func encodeData(from data: Project) throws -> Data? {
        guard let encoded = try? JSONEncoder().encode(data) else {
            throw RequestError.encodingError
        }
        return encoded
    }
    
    func createURL(category: String, id: Int?) throws -> URL {
        var url = URL(string: Constants.apiAddress)
        url?.appendPathComponent(category)
        
        if let id = id { url?.appendPathComponent(String(id)) }
        guard let url = url else { throw RequestError.cannotCreateURL }
        return url
    }
    
    func makeRequest(from url: URL) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "Bearer \(Constants.token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func decodeResponse(data: Data) throws -> Project? {
        return try JSONDecoder().decode(Project.self, from: data)
    }
}
