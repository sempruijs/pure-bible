//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = Settings(verseNumbers: false, fontSize: 12.0, fontName: "System")
    
    let fontOptions = ["System", "Times New Roman", "Courier", "Arial", "Helvetica"]

    var body: some View {
        BibleView(settings: settings)
            .toolbar {
                ToolbarItemGroup {
                    // Toggle for Verse Numbers
                    Toggle(isOn: $settings.verseNumbers) {
                        Image(systemName: "numbers")
                    }
                    .accessibilityLabel("Verse Numbers")
                    .keyboardShortcut("s")

                    // Decrease Font Size Button
                    Button(action: {
                        settings.fontSize = max(settings.fontSize - 1, 8)
                    }) {
                        Image(systemName: "minus")
                    }
                    .keyboardShortcut("-", modifiers: .command)
                    .accessibilityLabel("Decrease Font Size")

                    // Increase Font Size Button
                    Button(action: {
                        settings.fontSize = min(settings.fontSize + 1, 40)
                    }) {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("=", modifiers: .command)
                    .accessibilityLabel("Increase Font Size")

                // Popup Button for Font Selection
                    Picker(selection: $settings.fontName, label: Image(systemName: "textformat")) {
                           ForEach(fontOptions, id: \.self) { font in
                               Text(font).tag(font)
                           }
                       }
                       .pickerStyle(MenuPickerStyle()) // Ensures it behaves like a menu
                       .accessibilityLabel("Change Font Type")
                }
            }
    }
}

#Preview {
    ContentView()
}
