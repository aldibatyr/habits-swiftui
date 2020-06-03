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
    let habit: Habit
    var body: some View {
        VStack() {
                Text(habit.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text(habit.description)
                    .padding()
            HStack {
                Text("\(habit.timesFinished) times completed")
                Spacer()
                Button("Complete") {
                    self.presentationMode.wrappedValue.dismiss()
                  }
            }
  
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DetailedHabitView_Previews: PreviewProvider {
    static var habit = Habit(name: "test", description: "test")
    static var previews: some View {
        DetailedHabitView(habit: habit)
    }
}
