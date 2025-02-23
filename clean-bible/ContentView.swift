//
//  ContentView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BibleView()
    }
}

struct BibleView: View {
    let bible: Bible? = loadBible()
    
    var body: some View {
        NavigationView {
            List {
                if let books = bible?.books {
                    ForEach(books, id: \.name) { book in
                        NavigationLink(destination: BookView(book: book)) {
                            Text(book.name)
                        }
                    }
                } else {
                    Text("Loading Bible...")
                }
            }
            .navigationTitle("Bible")
            .accessibilityLabel("books")
        }
    }
}

struct BookView: View {
    let book: Book
    
    var body: some View {
        NavigationView {
            List(book.chapters, id: \.chapter) { chapter in
                NavigationLink(destination: ChapterView(chapter: chapter)) {
                    Text("\(chapter.chapter)")
                }
            }
            .navigationTitle(book.name)
            .accessibilityLabel("chapters")
        }
    }
}

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

#Preview {
    ContentView()
}
