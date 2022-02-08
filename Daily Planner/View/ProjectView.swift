//
//  ProjectView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct ProjectView: View {
    
    @StateObject var projectViewModel = ProjectViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(projectViewModel.projects) { project in
                        NavigationLink {
                            FormView(projectViewModel: projectViewModel)
                        } label: {
                            Text(project.name)
                        }
                    }
                }
                .task {
                    await projectViewModel.loadProjects()
                }
                ButtonView(projectViewModel: projectViewModel)
            }
            .navigationTitle("Projects")
            .toolbar {
                ToolbarItem() {
                    EditButton()
                }
            }
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}


