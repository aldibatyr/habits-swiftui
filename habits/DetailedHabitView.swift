//
//  DetailedHabitView.swift
//  habits
//
//  Created by Aldiyar B on 6/2/20.
//  Copyright © 2020 Aldiyar B. All rights reserved.
//

import SwiftUI

struct DetailedHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var timeAmount = 0.0
    var habit: Habit
    var body: some View {
            VStack {
                Text(habit.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(habit.description)
                Spacer()
                HStack {
                    Text("Spent more time?")
                        .padding(.trailing)
                    Stepper("\(timeAmount, specifier: "%.2f") hours", value: $timeAmount, step: 0.25)
                }
                Button("Save") {
                    habit.updateTimeSpent(additionalAmount: timeAmount)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DetailedHabitView_Previews: PreviewProvider {
    static var habit = Habit(name: "test", description: "test", timeSpent: 0.25)
    static var previews: some View {
        DetailedHabitView(habit: habit)
    }
}
