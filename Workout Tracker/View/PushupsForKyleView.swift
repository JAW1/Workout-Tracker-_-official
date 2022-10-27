//
//  PushupsForKyleView.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/29/21.
//

import SwiftUI

struct PushupsForKyleView: View {

    var externalUrl: URL

    var body: some View {
        NavigationStack {
            Form {
                missionBody

                Section(header: Text("Learn More")) {
                    Link(destination: externalUrl) {
                        Label("Go to Facebook Page", systemImage: "link.circle.fill")
                    }
                }
            }
            .navigationBarTitle("Push-Ups for Kyle")
        }
    }

    var missionBody: some View {
        Section(header: Text("The Mission and Goal")) {
            Text("""
                Push-ups for Kyle is a family campaign to honor \
                his life as a son, husband, father, friend, martial \
                artist, and Marine. To honor the men and women \
                who serve in the Marine Corps and the military. \
                To bring awareness to physical and mental health \
                to all. In the 100 days leading up to the Marine \
                birthday (Nov. 10), we'll count as many as 50 \
                push-ups per person per day. Report your progress to \
                Richard (richlamx@hotmail.com or 801-360-1066).
                """)
                .multilineTextAlignment(.leading)
        }
    }
}

struct PushupsForKyleView_Previews: PreviewProvider {
    static var previews: some View {
        PushupsForKyleView(externalUrl: "https://bit.ly/PushupsForKyle".url)
    }
}
