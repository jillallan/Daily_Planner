//
//  TodoistDataModel.swift
//  Daily Planner
//
//  Created by Jill Allan on 31/01/2022.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var projects: [Project]
}

struct Project: Codable, Identifiable {
    let id: Int
//    var parent_id: Int?
    let name: String
//    let favorite: Bool
//    let color: Int
//    var inbox_project: Bool?
//    var team_inbox: Bool?
//    let shared: Bool
//    let sync_id: Int
}

