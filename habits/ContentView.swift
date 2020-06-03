//
//  ContentView.swift
//  habits
//
//  Created by Aldiyar B on 6/2/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    var body: some View {
        NavigationView {
            List{
                ForEach(habits.content) {habit in
                    NavigationLink(destination: DetailedHabitView(habit: habit)) {
                        HStack {
                            Text(habit.name)
                                .font(.headline)
                            Spacer()
                            Text("\(habit.timeSpent, specifier: "%.2f") hours")
                        }
                    }
                }
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddHabit = true
            }, label: {
                Image(systemName: "plus")
            }))
        }
        .sheet(isPresented: $showingAddHabit, content: {
            AddHabitView(habits: self.habits)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
