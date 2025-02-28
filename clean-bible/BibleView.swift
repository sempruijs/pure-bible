//
//  BibleView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct BibleView: View {
    @Binding var selectedBook: Book?
    @Binding var selectedChapter: Chapter?
    let bible: Bible
    let settings: Settings
    
    var body: some View {
          NavigationSplitView {
              List(bible.books, id: \.self, selection: $selectedBook) { book in
                  Text(book.name)
              }
              .navigationTitle("Books")
              .accessibilityLabel("books")
          } content: {
              if let selectedBook {
                  List(selectedBook.chapters, id: \.self, selection: $selectedChapter) { chapter in
                      Text("\(chapter.chapter)")
                  }
                  .navigationTitle("Chapters")
                  .accessibilityLabel("Chapters")
              } else {
                  Text("Select a chapter")
                      .navigationTitle("chapters")
              }
          } detail: {
              if let selectedChapter {
                  ChapterView(chapter: selectedChapter, settings: settings)
              } else {
                  Text("select a chapter")
              }
              
          }
    }
}

//#Preview {
//    BibleView(true)
//}
