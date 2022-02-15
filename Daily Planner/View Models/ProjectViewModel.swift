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
    @Published var todoTasks = [TodoTask]()
    
    let getTasksRequest = GetTasksRequest()
    var getTasksRequestLoader: GetTasksRequestLoader<GetTasksRequest>!

    
    let projectRequest = NetworkRequest<Project>()
    var requestLoader: RequestLoader<NetworkRequest<Project>>!
    

    
    func loadProjects() async {
        requestLoader = RequestLoader(apiRequest: projectRequest)
        do {
            let projectArray = try await requestLoader.loadRequest(category: "projects", id: nil, with: nil)
            self.projects = projectArray!
//            self.projects = projectArray as! [Project]
        } catch {
            print(error.localizedDescription)
        }
    }

        
    func loadTasks() async {
        getTasksRequestLoader = GetTasksRequestLoader(apiRequest: getTasksRequest)
        do {
            if let todoTaskArray = try await getTasksRequestLoader.loadRequest(category: "tasks") {
                self.todoTasks = todoTaskArray
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}
