//
//  model.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import Foundation

struct Bible: Codable {
    let books: [Book]
}

struct Book: Codable {
    let name: String
    let chapters: [Chapter]
}

struct Chapter: Codable {
    let chapter: Int
    let name: String
    let verses: [Verse]
}

struct Verse: Codable {
    let verse: Int
    let chapter: Int
    let name: String
    let text: String
}

func loadBible() -> Bible? {
    guard let url = Bundle.main.url(forResource: "svv", withExtension: "json") else {
        print("Bible JSON file not found")
        return nil
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Bible.self, from: data)
    } catch {
        print("Error decoding Bible JSON: \(error)")
        return nil
    }
}

struct Settings {
    var verseNumbers: Bool
    var fontSize: CGFloat
}
