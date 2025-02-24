//
//  BookView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct BookView: View {
    let book: Book
    let settings: Settings
    
    var body: some View {
        NavigationView {
            List(book.chapters, id: \.chapter) { chapter in
                NavigationLink(destination: ChapterView(chapter: chapter, settings: settings)) {
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
