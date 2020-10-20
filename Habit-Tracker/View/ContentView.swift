//
//  ContentView.swift
//  Habit-Tracker
//
//  Created by PRABALJIT WALIA     on 20/10/20.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var holdedAct = holdActivities()
    @State private var showingAddHabits = false
    
    var body: some View {
        
        
        NavigationView{
            List{
                ForEach(holdedAct.activities){ activity in
                    HStack{
                        VStack(alignment: .leading){
                            Text(activity.activityTitle)
                                .font(.headline)
                            Text(activity.activityDescription)
                        }
                        Spacer()
                    }
                }
                
            }
            .sheet(isPresented:$showingAddHabits){
                AddView( hactivity: self.holdedAct)
            }
            .navigationBarTitle("My Habits")
            .navigationBarItems(trailing: Button(action:{
                self.showingAddHabits = true
            }){
                Image(systemName: "plus")
            }
            )
        }
        
    }
    func removeItems(at offsets:IndexSet){
        holdedAct.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
