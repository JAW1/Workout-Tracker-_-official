//
//  Image+UIImage.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/29/21.
//

import SwiftUI

extension Image {
    static func uiImage(named name: String, defaultImage: String) -> Image {
        if let image = UIImage(named: name) {
            return Image(uiImage: image)
        } else {
            return Image(systemName: defaultImage)
        }
    }
}
