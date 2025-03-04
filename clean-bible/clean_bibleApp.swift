//
//  clean_bibleApp.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

@main
struct clean_bibleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        Settings {
            GeneralSettingsView()
        }
        #endif
    }
}
