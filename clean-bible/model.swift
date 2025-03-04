//
//  model.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import Foundation
import SwiftUI

struct Bible: Codable, Hashable {
    let books: [Book]
}

struct Book: Codable, Hashable {
    let name: String
    let chapters: [Chapter]
}

struct Chapter: Codable, Hashable {
    let chapter: Int
    let name: String
    let verses: [Verse]
}

struct Verse: Codable, Hashable {
    let verse: Int
    let chapter: Int
    let name: String
    let text: String
}

//struct BibleData {
//    static let shared: Bible? = {
//        return loadBible()
//    }()
//    
//    static let oldTestamentBooks: [Book] = shared?.books.prefix(39).map { $0 } ?? []
//    static let apocryphaBooks: [Book] = shared?.books.dropFirst(39).prefix(14).map { $0 } ?? []
//    static let newTestamentBooks: [Book] = shared?.books.suffix(shared?.books.count ?? 0 - 53).map { $0 } ?? []
//}

class BibleData: ObservableObject {
    @Published var bible: Bible
    
    init() {
        self.bible = loadBible() ?? Bible(books: [])
    }

    var oldTestamentBooks: [Book] {
        Array(bible.books.prefix(39))
    }

    var apocryphaBooks: [Book] {
        Array(bible.books.dropFirst(39).prefix(14))
    }

    var newTestamentBooks: [Book] {
        Array(bible.books.suffix(bible.books.count - 53))
    }
}
