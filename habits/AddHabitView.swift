//
//  AddHabitView.swift
//  habits
//
//  Created by Aldiyar B on 6/2/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var description = ""
    @State private var timeSpent = 0.0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var alertShowing = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Stepper("Time Spent: \(timeSpent, specifier: "%.2f")", value: $timeSpent, in: 0...10, step: 0.25)
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing: Button(action: {
                self.addHabit()
            }, label: {
                Text("Save")
            }))
        }
    .alert(isPresented: $alertShowing, content: {
        Alert(title: Text(self.errorTitle), message: Text(self.errorMessage), dismissButton: .default(Text("Return")))
    })
    }
    
    func addHabit() {
        if (name != "" && description != "") {
            let newHabit = Habit(name: self.name, description: self.description, timeSpent: self.timeSpent)
            self.habits.content.append(newHabit)
            self.presentationMode.wrappedValue.dismiss()
        } else {
            self.alertShowing = true
            self.errorTitle = "Not that fast"
            self.errorMessage = "Name and Description fields must not be empty"
        }
        
        
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
