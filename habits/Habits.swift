//
//  Habits.swift
//  habits
//
//  Created by Aldiyar B on 6/2/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import Foundation

private let defaultKey = "Habits"

class Habits: ObservableObject {
    @Published var content = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(content) {
                UserDefaults.standard.set(encoded, forKey: defaultKey)
            }
        }
    }
    
    init() {
        if let content = UserDefaults.standard.data(forKey: defaultKey) {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Habit].self, from: content) {
                self.content = decoded
                return
            }
        }
        self.content = []
    }
}
