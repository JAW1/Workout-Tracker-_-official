//
//  PushupModel.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/18/22.
//

import Foundation

struct PushupTally: Identifiable, Codable {
    var id = UUID()
    var count: Int
    var date: Date
}

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

    private func save() {
        let encoder = JSONEncoder()

        if let jsonData = try? encoder.encode(pushupTallies) {
            UserDefaults.standard.set(jsonData, forKey: Key.tallies)
        }
    }
}