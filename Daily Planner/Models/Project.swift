//
//  TodoistDataModel.swift
//  Daily Planner
//
//  Created by Jill Allan on 31/01/2022.
//

import Foundation

struct Response: Codable {
    var projects: [Project]
}

struct Project: Codable, Identifiable {
    var id: Int?
    var name: String
}

//struct Project
