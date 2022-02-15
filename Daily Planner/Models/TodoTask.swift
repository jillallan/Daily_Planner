//
//  Task.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import Foundation

struct TodoTask: Codable, Identifiable {
    var id: Int?
//    var project_id: Int?
//    var section_id: Int?
    let content: String
}
