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
    @State private var projectName = ""

    
    var body: some View {
        VStack(alignment: .leading) {
            FormView(projectViewModel: projectViewModel)
            Button {
                // Add project
                dismiss()
            } label: {
                Text("Add")
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

//    @FocusState private var addProjectIsFocused: Bool!
//                .focused($addProjectIsFocused)
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                        /// Anything over 0.5 seems to work
//                        self.addProjectIsFocused = true
//                    }
//                }
