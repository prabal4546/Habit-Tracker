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
            .navigationBarItems(leading: Button("Save"){
                let item = Activity(activityTitle: self.title, activityDescription: self.desc)
                self.hactivity.activities.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView( hactivity: holdActivities())
    }
}
