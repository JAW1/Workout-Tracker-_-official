//
//  WorkoutRecordView.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import SwiftUI

struct WorkoutRecordView: View {

    @ObservedObject var workoutViewModel: WorkoutViewModel

    var body: some View {
        NavigationStack {
            Form {
                totalBody
                individualWorkoutsBody
            }
            .navigationTitle("Workout Tracker")
            .toolbar {
                Button {
                    workoutViewModel.createNew(PushupTally(count: 50, date: .now))
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            }
        }
    }

    var individualWorkoutsBody: some View {
        Section {
            List {
                ForEach(workoutViewModel.workoutReports) { workoutReport in
                    HStack {
                        Text("\(workoutReport.date)")
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
        WorkoutRecordView(workoutViewModel: WorkoutViewModel())
    }
}
