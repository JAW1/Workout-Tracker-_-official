//
//  AddWorkoutView.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/25/22.
//

import SwiftUI

struct AddWorkoutView: View {

    @ObservedObject var workoutViewModel: WorkoutViewModel

    @State private var numberOfPushups = "50"
    @State private var date = Date()

    @Binding var showAddWorkoutViewModal: Bool

    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("Number of Pushups")
                    TextField("Number of Pushups", text: $numberOfPushups)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numbersAndPunctuation)
                }
                DatePicker(
                    selection: $date,
                    displayedComponents: .date
                ) {
                    Text("Date")
                }
            }
            .navigationBarTitle("Add Workout", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAddWorkoutViewModal = false
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem {
                    Button {
                        saveWorkout()
                        showAddWorkoutViewModal = false
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }

    private func saveWorkout() {
        let number = numberOfPushups.trimmingCharacters(in: .whitespacesAndNewlines)

        if let pushupCount = Int(number) {
            if pushupCount > 0 {
                workoutViewModel.createNew(PushupTally(count: pushupCount, date: date))
            }
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(workoutViewModel: WorkoutViewModel(), showAddWorkoutViewModal: .constant(true))
    }
}
