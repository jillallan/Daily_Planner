//
//  FormView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct FormView: View {
    
    @ObservedObject var projectViewModel: ProjectViewModel
    @State private var projectName = ""
    @State private var dueDate = Date.now
    @State private var taskPriority = 0
    
    var body: some View {
        Text("Hello")
//        Form {
//            Section {
//                TextField("Project Name", text: $projectName)
//            }
//            Section {
//                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
//                    .datePickerStyle(.compact)
////                    .labelsHidden()
//            } header: {
//                Text("Details")
//            } footer: {
//                Text("Comments")
//            }
//
//        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            FormView(projectViewModel: ProjectViewModel())
        }
    }
}
