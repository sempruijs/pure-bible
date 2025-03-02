//
//  ChapterView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    @Binding var settings: Settings
    @Binding var selectedVerse: Int?
    
    @AccessibilityFocusState
        private var focus: Int?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(chapter.verses, id: \.verse) { verse in
                    Text(showVerse(verse: verse, withNumber: settings.verseNumbers))
                        .padding(.bottom, 2)
                        .font(
                            settings.fontName == "System"
                            ? .system(.body)  // Use system font with Dynamic Type
                            : .custom(settings.fontName, size: 17, relativeTo: .body) // Use custom font with Dynamic Type
                        )
                        .textSelection(.enabled)
                        .accessibilityFocused($focus, equals: verse.verse)
                }
            }
            .padding()
        }
        .navigationTitle("\(chapter.name)")
        .accessibilityLabel("\(chapter.name)")
        #if os(IOS)
        .toolbar {
                    // Add the button to the top-right of the toolbar
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Toggle visibility
                            settings.verseNumbers.toggle()
                        }) {
                            Image(systemName: "number.circle")  // You can use any icon
                                .imageScale(.small)  // Small icon
                        }
                        .accessibilityLabel(settings.verseNumbers ? "Hide verse numbers" : "Show verse numbers")
                    }
                }
            #endif
//        .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                            focus = selectedVerse
//                        }
//                    }
    }
}

func showVerse(verse: Verse, withNumber: Bool) -> String {
    if withNumber {
        return "\(verse.verse). \(verse.text)"
    }
    return "\(verse.text)"
}


//#Preview {
//    ChapterView()
//}
