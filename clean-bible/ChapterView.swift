//
//  ChapterView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(chapter.verses, id: \.verse) { verse in
                    Text("\(verse.verse). \(verse.text)")
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


//#Preview {
//    ChapterView()
//}
