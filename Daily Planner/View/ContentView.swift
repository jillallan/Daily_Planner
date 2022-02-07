//
//  ContentView.swift
//  Daily Planner
//
//  Created by Jill Allan on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoistViewModel = ProjectViewModel()
    @State private var showingAddSheet = false
    @State private var projectName = ""
    @FocusState private var addProjectIsFocused: Bool
//    @Environment(\.dismiss) var dismiss
//    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                
                
                ForEach(todoistViewModel.projects) { project in
                    NavigationLink(destination: Text(project.name)) {
                        Text(project.name)
                    }

                }
                .onMove(perform: moveProject)
//                .onDelete(perform: deleteProject)
            }
            .task {
                await todoistViewModel.loadProjects()
            }
            .navigationTitle("Projects")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    #if os(iOS)
                    EditButton()
                    #endif
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    
                    Button {
                        showingAddSheet.toggle()

                    } label: {
                        Text("Add")
                    }
                    .sheet(isPresented: $showingAddSheet) {
                        // on dismiss
                        print("project added")
                    } content: {
                        VStack {
                            Text("Add a new project")
                            TextField("Project Name", text: $projectName)
                                .focused($addProjectIsFocused)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                        /// Anything over 0.5 seems to work
                                        self.addProjectIsFocused = true
                                    }
                                }
                            HStack {
                                Button {
                                    Task {
                                        await todoistViewModel.addProject(projectName)
                                        await todoistViewModel.loadProjects()
                                    }
//                                    dismiss()
                                    showingAddSheet = false
                                } label: {
                                    Text("Add")
                                }
                                Button {
                                    showingAddSheet = false
                                } label: {
                                    Text("Cancel")
                                }
                            }

                        }
                        
                    }

                }
            }
        }
    }
    
    func moveProject(from: IndexSet, to: Int) {
        withAnimation {
            // does not update todoist
            todoistViewModel.projects.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteProject() {
        withAnimation {
            // call api request to update model

        }
    }
    
    func addProject() {
        withAnimation {
            //
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

