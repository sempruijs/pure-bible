//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showVerseNumbers") private var showVerseNumbers = true
    @AppStorage("fontSize") private var fontSize: Double = 12.0
    @AppStorage("fontName") private var fontName: String = "System"
    
    @State private var showSwitchView = false
    @State private var searchText = ""
    @State private var presentedChapters: [ChapterView] = []
    
    @State private var selectedBook: Book?
    @State private var selectedChapter: Chapter?
    
    @State private var selectedVerse: Int? = nil 
    
    let fontOptions = ["System", "Times New Roman", "Courier", "Arial", "Helvetica"]
    
    @StateObject private var bibleData = BibleData()

    var body: some View {
        ZStack {
//            if let bible = loadBible() {
                #if os(macOS)
                if showSwitchView {
//                    QuickSwitcherView(bibleData: bibleData, showSwitchView: $showSwitchView, searchText: $searchText, selectedChapter: $selectedChapter, selectedBook: $selectedBook, selectedVerse: $selectedVerse)
////                        .frame(maxWidth: 400)
//                        .zIndex(1)  // Ensure it shows on top of the main content
                }
                #endif
            BibleView(selectedBook: $selectedBook, selectedChapter: $selectedChapter, selectedVerse: $selectedVerse, bibleData: bibleData)
                    .toolbar {
                        ToolbarItemGroup {
                            // Toggle for Verse Numbers
                            Toggle(isOn: $showVerseNumbers) {
                                Image(systemName: "numbers")
                            }
                            .accessibilityLabel("Verse Numbers")
                            .keyboardShortcut("s")
                            
                            // Decrease Font Size Button
                            Button(action: {
                                fontSize = max(fontSize - 1, 8)
                            }) {
                                Image(systemName: "minus")
                            }
                            .keyboardShortcut("-", modifiers: .command)
                            .accessibilityLabel("Decrease Font Size")
                            
                            // Increase Font Size Button
                            Button(action: {
                                fontSize = min(fontSize + 1, 40)
                            }) {
                                Image(systemName: "plus")
                            }
                            .keyboardShortcut("=", modifiers: .command)
                            .accessibilityLabel("Increase Font Size")
                            
                            // Popup Button for Font Selection
                            Picker(selection: $fontName, label: Image(systemName: "textformat")) {
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
//            } else {
//                Text("Loading bible")
//            }
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
