//
//  Requestable2.swift
//  Daily Planner
//
//  Created by Jill Allan on 02/02/2022.
//

import Foundation

protocol Requestable {
    associatedtype RequestDataType
    associatedtype ResponseDataType

    func encodeData(from data: RequestDataType) throws -> Data?
    func createURL(category: String, id: Int?) throws -> URL
    func makeRequest(from url: URL) throws -> URLRequest
    func decodeResponse(data: Data) throws -> ResponseDataType?
}
