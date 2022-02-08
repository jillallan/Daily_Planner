//
//  Task.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: Int?
    let project_id: Int?
    let section_id: Int?
}
