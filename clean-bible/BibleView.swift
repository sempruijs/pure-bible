//
//  BibleView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

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
    BibleView()
}
