//
//  AddSheetView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct AddSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var projectViewModel: ProjectViewModel
    @State private var taskName = ""

    
    var body: some View {
        VStack(alignment: .leading) {

            TextField("Task Name", text: $taskName)

          
            HStack {
                Spacer()
                Button {
                    // Add task
                    dismiss()
                } label: {
                    Text("Add")
                        .frame(width: 80)
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                
                Spacer()
                Button {
                    // Add task
                    dismiss()
                } label: {
                    Text("Cancel")
                        .frame(width: 80)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.mint)
                
                Spacer()
            }

        }
        .padding()
    }
}

struct AddSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSheetView(projectViewModel: ProjectViewModel())
    }
}
