//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Vikas Surera on 09/07/22.
//

import SwiftUI

@main
struct LandmarkApp: App {
    // State property of the ObservableObject
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
