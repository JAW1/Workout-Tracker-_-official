//
//  WorkoutRecordView.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import SwiftUI

struct WorkoutRecordView: View {

    @EnvironmentObject var workoutViewModel: WorkoutViewModel
//    @Environment(\.editMode) var editMode
    @State private var showAddWorkoutModal = false

    var body: some View {
        NavigationStack {
            Form {
                totalBody
                individualWorkoutsBody
            }
            .navigationTitle("Workout Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAddWorkoutModal = true
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                ToolbarItem {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddWorkoutModal) {
                AddWorkoutView(workoutViewModel: workoutViewModel, showAddWorkoutViewModal: $showAddWorkoutModal)
            }
        }
    }

    var individualWorkoutsBody: some View {
        Section(header: Text("Individual Workouts")) {
            let workoutReports = workoutViewModel.workoutReports

            if workoutReports.count > 0 {
                List {
                    ForEach(workoutReports) { workoutReport in
                        HStack {
                            Text("\(workoutReport.formattedDate)")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("\(workoutReport.count)")
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { workoutViewModel.removeWorkoutReport(at: $0) }
                    }
                }
            } else {
                Button {
                    showAddWorkoutModal = true
                } label: {
                    Label("Add your first workout", systemImage: "plus.circle")
                }
            }
        }
    }

    var totalBody: some View {
        Section {
            HStack {
                Text("Grand total push-ups").fontWeight(.semibold)
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
