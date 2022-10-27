//
//  WorkoutViewModel.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import Foundation

class WorkoutViewModel: ObservableObject {

    private struct Constants {
        static let maxDaysPerMonth = 31

        static let maxDailyPushupsForKyle = 50
        static let maxDateValueForKyle = 11 * maxDaysPerMonth + 10
        static let minDateValueForKyle = 8 * maxDaysPerMonth + 3
    }

    @Published var model = PushupModel()

    // MARK: - Model access

    var pushupsThatCount: Int {
        model.pushupTallies
            .filter({ dateCountsForKyle($0.date) })
            .reduce(0) { $0 + $1.count }
    }

    var totalCount: Int { model.pushupTallies.reduce(0) { $0 + $1.count } }
    var workoutReports: [PushupTally] { model.pushupTallies }

    // MARK: - User intents

    func createNew(_ workoutReport: PushupTally) {
        model.append(workoutReport)
    }

    func removeWorkoutReport(at index: Int) {
        model.removePushupTally(at: index)
    }

    func update(_ count: Int, for workoutReport: PushupTally) {
        model.update(count, for: workoutReport)
    }

    // MARK: - Helpers

    private func dateCountsForKyle(_ date: Date) -> Bool {
        let components = Calendar.current.dateComponents([.month, .day], from: date)

        guard let month = components.month, let day = components.day else {
            return false
        }

        let dateValue = month * Constants.maxDaysPerMonth + day

        return dateValue >= Constants.minDateValueForKyle
               && dateValue <= Constants.maxDateValueForKyle
    }

}
