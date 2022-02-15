//
//  ProjectView.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import SwiftUI

struct ProjectListViewCell: View {
    
    var project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(project.name)
                .font(.title)
            Text("ID: \(String(project.id))")
        }
    }
}

struct ProjectListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListViewCell(project: Project(id: 10, name: "Test Project"))
    }
}
