//
//  BibleView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct BibleView: View {
    @State private var selectedBook: Book? // Holds the selected item
    @State private var selectedChapter: Chapter? // Holds the selected item
    let items = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy"]
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
                      Text(chapter.name)
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
