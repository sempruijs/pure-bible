//
//  BibleView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct BibleView: View {
    let bible: Bible
    let settings: Settings
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bible.books, id: \.name) { book in
                    NavigationLink(destination: BookView(book: book, settings: settings)) {
                        Text(book.name)
                    }
                }
            }
            .navigationTitle("Bible")
            .accessibilityLabel("books")
        }
    }
}

//#Preview {
//    BibleView(true)
//}
