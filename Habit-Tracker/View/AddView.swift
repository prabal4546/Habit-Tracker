//
//  AddView.swift
//  Habit-Tracker
//
//  Created by PRABALJIT WALIA     on 20/10/20.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var hactivity: holdActivities
    
    @State private var title = ""
    @State private var desc = ""
    var body: some View {
        NavigationView{
            Form{
                TextField("Title", text: $title)
                    .font(.headline)
                TextField("Desc", text: $desc)
            }
            .navigationBarTitle("Add Habits")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView( hactivity: holdActivities())
    }
}
