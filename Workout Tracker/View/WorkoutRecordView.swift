//
//  WorkoutRecordView.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import SwiftUI

struct WorkoutRecordView: View {

    @EnvironmentObject var workoutViewModel: WorkoutViewModel

    @State private var showAddWorkoutModal = false

    var body: some View {
        NavigationStack {
            Form {
                totalBody
                individualWorkoutsBody
            }
            .navigationTitle("Workout Tracker")
            .toolbar {
                Button {
                    showAddWorkoutModal = true
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $showAddWorkoutModal) {
                AddWorkoutView(workoutViewModel: workoutViewModel, showAddWorkoutViewModal: $showAddWorkoutModal)
            }
        }
    }

    var individualWorkoutsBody: some View {
        Section {
            List {
                ForEach(workoutViewModel.workoutReports) { workoutReport in
                    HStack {
                        Text("\(workoutReport.formattedDate)")
                        Spacer()
                        Text("\(workoutReport.count)")
                    }
                }
            }
        }
    }

    var totalBody: some View {
        Section {
            HStack {
                Text("Grand total push-ups").bold()
                Spacer()
                Text("\(workoutViewModel.totalCount)")
            }
        }
    }
}

struct WorkoutRecordView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRecordView().environmentObject(WorkoutViewModel())
    }
}
