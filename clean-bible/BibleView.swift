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
//    let bible: Bible
    let settings: Settings
    
    @Binding var selectedVerse: Int?
    
    let bibleData: BibleData
    
    var body: some View {
          NavigationSplitView {
              List(selection: $selectedBook) {
//                  Text(book.name)
                  Section(header: Text("Old Testament")) {
                      ForEach(bibleData.oldTestamentBooks, id: \.self) { book in
                              Text(book.name)
                          }
                      }
                      
                      Section(header: Text("Apocrypha")) {
                          ForEach(bibleData.apocryphaBooks, id: \.self) { book in
                              Text(book.name)
                          }
                      }
                      
                      Section(header: Text("New Testament")) {
                          ForEach(bibleData.newTestamentBooks, id: \.self) { book in
                              Text(book.name)
                          }
                      }
              }
              .navigationTitle("Books")
              .accessibilityLabel("books")
          } content: {
              if let selectedBook {
                  List(selectedBook.chapters, id: \.self, selection: $selectedChapter) { chapter in
                      Text("\(chapter.chapter)")
                  }
                  .navigationTitle("\(selectedBook.name)")
                  .accessibilityLabel("Chapters")
              } else {
                  Text("Select a chapter")
                      .navigationTitle("chapters")
              }
          } detail: {
              if let selectedChapter {
                  ChapterView(chapter: selectedChapter, settings: settings, selectedVerse: $selectedVerse)
              } else {
                  Text("select a chapter")
              }
              
          }
    }
}

//#Preview {
//    BibleView(true)
//}
