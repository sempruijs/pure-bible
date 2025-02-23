//
//  BookView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct BookView: View {
    let book: Book
    let showVerseNumbers: Bool
    
    var body: some View {
        NavigationView {
            List(book.chapters, id: \.chapter) { chapter in
                NavigationLink(destination: ChapterView(chapter: chapter, showVerseNumbers: showVerseNumbers)) {
                    Text("\(chapter.chapter)")
                }
            }
            .navigationTitle(book.name)
            .accessibilityLabel("chapters")
        }
    }
}

//#Preview {
//    BookView()
//}
