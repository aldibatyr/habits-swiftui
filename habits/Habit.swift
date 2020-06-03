//
//  Habit.swift
//  habits
//
//  Created by Aldiyar B on 6/2/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import Foundation

struct Habit: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var timesFinished: Int = 0
}
