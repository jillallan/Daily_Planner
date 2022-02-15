//
//  ProjectRequest.swift
//  Daily Planner
//
//  Created by Jill Allan on 15/02/2022.
//

import Foundation

struct NetworkRequest<T: Codable>: Requestable {
    
    typealias RequestDataType = [T]
    typealias ResponseDataType = [T]

    func encodeData(from data: RequestDataType) throws -> Data? {
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

    func configureRequest(from url: URL, method: String = "GET") throws -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method
        if method == "POST" {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        guard let token = Constants.token else { throw RequestError.apiKeyError }

        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }

    func decodeResponse(data: Data) throws -> ResponseDataType? {
        return try JSONDecoder().decode(ResponseDataType.self, from: data)
    }
}
