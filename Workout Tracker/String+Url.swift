//
//  String+Url.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/26/21.
//

import Foundation

extension String {
    var url: URL {
        if let urlValue = URL(string: self) {
            return urlValue
        }

        fatalError("Unable to convert URL to string")
    }
}
