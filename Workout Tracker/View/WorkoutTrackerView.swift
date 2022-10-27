//
//  WorkoutTrackerView.swift
//  Workout Tracker
//
//  Created by Stephen Liddle on 10/27/22.
//

import SwiftUI

struct WorkoutTrackerView: View {
    private struct Url {
        static let hundredPushups = "https://hundredpushups.com".url
        static let pushupsForKyle = "https://bit.ly/PushupsForKyle".url
    }

    var body: some View {
        TabView {
            WorkoutRecordView().environmentObject(WorkoutViewModel())
                .tabItem {
                    Label("Push-Ups", systemImage: "list.dash")
                }
            PushupsForKyleView(externalUrl: Url.pushupsForKyle)
                .tabItem {
                    Label {
                        Text("Push-Ups for Kyle")
                    } icon: {
                        Image.uiImage(named: "Pushups", defaultImage: "link")
                    }
                }
            WebView(request: URLRequest(url: Url.hundredPushups))
                .tabItem {
                    Label("HundredPushups", systemImage: "globe")
                }
        }
    }
}

struct WorkoutTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTrackerView()
    }
}
