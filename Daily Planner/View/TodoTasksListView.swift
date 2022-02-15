//
//  TodoTasksView.swift
//  Daily Planner
//
//  Created by Jill Allan on 08/02/2022.
//

import SwiftUI

struct TodoTasksListView: View {
    
    @ObservedObject var projectViewModel: ProjectViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(projectViewModel.todoTasks) { todoTask in
                    Text(todoTask.content)
                }
            }
            .task {
                await projectViewModel.loadTasks()
            }
            ButtonView(projectViewModel: projectViewModel)
        }
    }
}


struct TodoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTasksListView(projectViewModel: ProjectViewModel())
    }
}
