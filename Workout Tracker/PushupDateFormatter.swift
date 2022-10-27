//
//  PushupDateFormatter.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/26/21.
//

import Foundation

class PushupDateFormatter {

    let dateFormatter: DateFormatter

    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }

    static let shared: PushupDateFormatter = {
        PushupDateFormatter()
    }()
}
