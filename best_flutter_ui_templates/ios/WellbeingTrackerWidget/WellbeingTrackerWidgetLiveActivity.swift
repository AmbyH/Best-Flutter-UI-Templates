//
//  WellbeingTrackerWidgetLiveActivity.swift
//  WellbeingTrackerWidget
//
//  Created by Amboise on 16/8/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WellbeingTrackerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WellbeingTrackerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WellbeingTrackerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WellbeingTrackerWidgetAttributes {
    fileprivate static var preview: WellbeingTrackerWidgetAttributes {
        WellbeingTrackerWidgetAttributes(name: "World")
    }
}

extension WellbeingTrackerWidgetAttributes.ContentState {
    fileprivate static var smiley: WellbeingTrackerWidgetAttributes.ContentState {
        WellbeingTrackerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WellbeingTrackerWidgetAttributes.ContentState {
         WellbeingTrackerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WellbeingTrackerWidgetAttributes.preview) {
   WellbeingTrackerWidgetLiveActivity()
} contentStates: {
    WellbeingTrackerWidgetAttributes.ContentState.smiley
    WellbeingTrackerWidgetAttributes.ContentState.starEyes
}
