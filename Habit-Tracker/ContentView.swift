//
//  ContentView.swift
//  Habit-Tracker
//
//  Created by PRABALJIT WALIA     on 20/10/20.
//

import SwiftUI

struct Activity:Identifiable, Codable{
    let id = UUID()
    let activityTitle:String
    let activityDescription:String
}
class holdActivities:ObservableObject{
    @Published var activities = [Activity](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities){
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
            
    }
        init(){
            if let items = UserDefaults.standard.data(forKey: "Activities"){
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Activity].self, from: items){
                    self.activities = decoded
                    return
                }
            }
            self.activities = []
        }
    }

struct ContentView: View {
    
    @State private var activity = ""
    @State private var description = ""
    
    var body: some View {
        
        
        NavigationView{
            Form{
                TextField("Activity", text: $activity)
                    .font(.headline)
                TextField("Description",text:$description)
            }
            .navigationTitle("My Habits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
