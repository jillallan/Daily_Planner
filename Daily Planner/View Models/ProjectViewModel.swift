//
//  TodoistViewModel.swift
//  Daily Planner
//
//  Created by Jill Allan on 01/02/2022.
//

import Foundation

@MainActor
class ProjectViewModel: ObservableObject {
    
    @Published var projects = [Project]()
    @Published var newProject = Project(name: "Placeholder")
    
    let getProjectsRequest = GetProjectsRequest()
    var getProjectsRequestLoader: GetProjectsRequestLoader<GetProjectsRequest>!
    
    let addProjectRequest = AddProjectRequest()
    var addProjectRequestLoader: AddProjectRequestLoader<AddProjectRequest>!
    
    func loadProjects() async {
        getProjectsRequestLoader = GetProjectsRequestLoader(apiRequest: getProjectsRequest)
        do {
            if let projectArray = try await getProjectsRequestLoader.loadRequest(category: "projects") {
                self.projects = projectArray
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addProject(_ project: String) async {
        let newProject = Project(name: project)
        addProjectRequestLoader = AddProjectRequestLoader(apiRequest: addProjectRequest)
        do {
            if let project = try await addProjectRequestLoader.loadRequest(category: "projects", with: newProject) {
                self.newProject = project
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
