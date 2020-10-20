//
//  Activity.swift
//  Habit-Tracker
//
//  Created by PRABALJIT WALIA     on 20/10/20.
//

import Foundation
struct Activity:Identifiable, Codable{
    let id = UUID()
    let activityTitle:String
    let activityDescription:String
}
