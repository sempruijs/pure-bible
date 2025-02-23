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

#Preview {
    ContentView()
}
