//
//  TodoistDataModel.swift
//  Daily Planner
//
//  Created by Jill Allan on 31/01/2022.
//

import Foundation

//struct Response: Codable {
//    var projects: [Project]
//}

struct Project: Codable, Identifiable {
    let id: Int?
    let parent_id: Int?
    let name: String
    let favorite: Bool?
    let color: Int?
    let inbox_project: Bool?
}

//struct Project
