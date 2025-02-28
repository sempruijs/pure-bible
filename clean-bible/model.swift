//
//  model.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import Foundation

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

struct Settings {
    var verseNumbers: Bool
    var fontSize: CGFloat
    var fontName: String
}
