//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showVerseNumbers = false
    
    var body: some View {
        BibleView(showVerseNumbers: showVerseNumbers)
            .toolbar {
                ToolbarItemGroup {
                    Toggle(isOn: $showVerseNumbers) {
                        Image(systemName: "italic")
                    }
                    .keyboardShortcut("s")
                }
            }
    }
}

#Preview {
    ContentView()
}
