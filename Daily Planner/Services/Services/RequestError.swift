//
//  APIRequestError.swift
//  Daily Planner
//
//  Created by Jill Allan on 01/02/2022.
//

import Foundation

enum RequestError: Error {
    case cannotCreateURL
    case invalidUrl
    case noData
    case encodingError
    case decodingError
    case apiKeyError
}
