//
//  WorkoutViewModel.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import Foundation

class WorkoutViewModel: ObservableObject {

    @Published var model = PushupModel()

    // MARK: - Model access

    var totalCount: Int { model.pushupTallies.reduce(0) { $0 + $1.count } }
    var workoutReports: [PushupTally] { model.pushupTallies }

    // MARK: - User intents

    func createNew(_ workoutReport: PushupTally) {
        model.append(workoutReport)
    }
}
