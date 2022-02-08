//
//  Constants.swift
//  Daily Planner
//
//  Created by Jill Allan on 31/01/2022.
//

import Foundation

struct Constants {
    static let apiAddress = "https://api.todoist.com/rest/v1"
    
    static let token = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
}
