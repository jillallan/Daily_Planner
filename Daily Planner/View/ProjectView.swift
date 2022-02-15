//
//  FormView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct ProjectView: View {
    
    var projectName: String
    
    var body: some View {
        Text(projectName)
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ProjectView(projectName: "New Project")
        }
    }
}
