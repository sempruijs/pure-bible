//
//  ChapterView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    let settings: Settings
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
