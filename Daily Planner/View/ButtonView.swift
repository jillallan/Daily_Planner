//
//  ButtonView.swift
//  Daily Planner
//
//  Created by Jill Allan on 07/02/2022.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var projectViewModel: ProjectViewModel
    @State private var showingAddSheet = false
    
    var body: some View {
        Button {
            showingAddSheet.toggle()
        } label: {
            Label("Add", systemImage: "plus")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        .background(.blue)
        .clipShape(Circle())
        .offset(x: -25)
        .labelStyle(.iconOnly)
        .sheet(isPresented: $showingAddSheet) {
            // Add project
        } content: {
            AddSheetView(projectViewModel: projectViewModel)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(projectViewModel: ProjectViewModel())
    }
}
