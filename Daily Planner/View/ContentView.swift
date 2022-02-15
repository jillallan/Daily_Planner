//
//  ProjectView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var projectViewModel = ProjectViewModel()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Projects", destination: ProjectListView(projectViewModel: projectViewModel))
                NavigationLink("Tasks", destination: TodoTasksListView(projectViewModel: projectViewModel))
            }
            
            .navigationTitle("Start")
            .toolbar {
                ToolbarItem() {
                    EditButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


