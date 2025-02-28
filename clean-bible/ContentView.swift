//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = Settings(verseNumbers: false, fontSize: 12.0, fontName: "System")
    @State private var showSwitchView = false
    @State private var searchText = ""
    @State private var presentedChapters: [ChapterView] = []
    
    @State private var selectedBook: Book?
    @State private var selectedChapter: Chapter?
    
    let fontOptions = ["System", "Times New Roman", "Courier", "Arial", "Helvetica"]

    var body: some View {
        ZStack {
            if let bible = loadBible() {
                if showSwitchView {
                    QuickSwitcherView(bible: bible, showSwitchView: $showSwitchView, searchText: $searchText, selectedChapter: $selectedChapter, selectedBook: $selectedBook)
                        .frame(maxWidth: 400)
                        .zIndex(1)  // Ensure it shows on top of the main content
                }
                BibleView(selectedBook: $selectedBook, selectedChapter: $selectedChapter, bible: bible, settings: settings)
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
                            
                            Toggle(isOn: $showSwitchView) {
                                Image(systemName: "magniﬁcationglass")
                            }
                            .accessibilityLabel("Quick switcher")
                            .keyboardShortcut("k")
                        }
                    }
            } else {
                Text("Loading bible")
            }
        }
    }
}

func loadBible() -> Bible? {
    guard let url = Bundle.main.url(forResource: "svv", withExtension: "json") else {
        print("Bible JSON file not found")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Bible.self, from: data)
    } catch {
        print("Error decoding Bible JSON: \(error)")
        return nil
    }
}

#Preview {
    ContentView()
}
