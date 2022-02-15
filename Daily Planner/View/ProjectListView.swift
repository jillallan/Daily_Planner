//
//  ProjectListView.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import SwiftUI

struct ProjectListView: View {
    
    @ObservedObject var projectViewModel: ProjectViewModel
    var body: some View {
        List {
            ForEach(projectViewModel.projects) { project in
                NavigationLink {
                    ProjectView(projectName: project.name)
                } label: {
                    ProjectListViewCell(project: project)
                }
            }
        }
        .task {
            await projectViewModel.loadProjects()
        }
        
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView(projectViewModel: ProjectViewModel())
    }
}
