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
                Button {
                    // workoutViewModel.createNew()
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(workoutViewModel: WorkoutViewModel())
    }
}
