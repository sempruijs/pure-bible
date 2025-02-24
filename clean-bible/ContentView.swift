//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = Settings(verseNumbers: false, fontSize: 12.0)
    
    var body: some View {
        BibleView(settings: settings)
            .toolbar {
                ToolbarItemGroup {
                    // Toggle for verse numbers
                    Toggle(isOn: $settings.verseNumbers) {
                        Image(systemName: "numbers")
                    }
                    .accessibilityLabel("Verse Numbers")
                    .keyboardShortcut("s")

                    // Decrease Font Size Button
                    Button(action: {
                        settings.fontSize = max(settings.fontSize - 2, 8) // Minimum size: 8
                    }) {
                        Image(systemName: "minus")
                    }
                    .keyboardShortcut("-", modifiers: .command)
                    .accessibilityLabel("Decrease Font Size")

                    // Increase Font Size Button
                    Button(action: {
                        settings.fontSize = min(settings.fontSize + 2, 40) // Maximum size: 40
                    }) {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("=", modifiers: .command)
                    .accessibilityLabel("Increase Font Size")
                }
            }
    }
}

#Preview {
    ContentView()
}
