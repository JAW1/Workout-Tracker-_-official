//
//  PushupModel.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import Foundation

struct PushupModel {
    private struct Key {
        static let tallies = "tallies"
    }

    var pushupTallies: [PushupTally] = []

    init() {
        if let jsonData = UserDefaults.standard.object(forKey: Key.tallies) as? Data {
            let decoder = JSONDecoder()

            if let tallies = try? decoder.decode([PushupTally].self, from: jsonData) {
                pushupTallies = tallies.sorted { $0.date < $1.date }
            }
        }
    }

    mutating func append(_ pushupTally: PushupTally) {
        pushupTallies.append(pushupTally)
        pushupTallies = pushupTallies.sorted { $0.date < $1.date }
        save()
    }

    mutating func removePushupTally(at index: Int) {
        if pushupTallies.indices.contains(index) {
            pushupTallies.remove(at: index)
            save()
        }
    }

    mutating func update(_ count: Int, for pushupTally: PushupTally) {
        if let index = pushupTallies.firstIndex(matching: pushupTally) {
            pushupTallies[index].count = count
            save()
        }
    }

    private func save() {
        let encoder = JSONEncoder()

        if let jsonData = try? encoder.encode(pushupTallies) {
            UserDefaults.standard.set(jsonData, forKey: Key.tallies)
        }
    }
}
