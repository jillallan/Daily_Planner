//
//  SheetView.swift
//  Daily Planner
//
//  Created by Jill Allan on 02/02/2022.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Dismiss")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
