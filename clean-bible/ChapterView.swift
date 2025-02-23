//
//  ChapterView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    let showVerseNumbers: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(chapter.verses, id: \.verse) { verse in
                    Text(showVerse(verse: verse, withNumber: showVerseNumbers))
                        .padding(.bottom, 2)
                        .textSelection(.enabled)
                }
            }
            .padding()
        }
        .navigationTitle("Chapter \(chapter.chapter)")
        .accessibilityLabel("chapter content")
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
