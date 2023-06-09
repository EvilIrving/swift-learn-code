//
//  swift_UIApp.swift
//  swift UI
//
//  Created by Actor on 2023/6/7.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
