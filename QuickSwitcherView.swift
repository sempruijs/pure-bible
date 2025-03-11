//
//  QuickSwitcherView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 24/02/2025.
//
//#if os(macOS)
//import SwiftUI
//import KBar
//
//struct QuickSwitcherView: View {
//    let bibleData: BibleData
//    @Binding var showSwitchView: Bool
//    @Binding var searchText: String
//    
//    @Binding var selectedChapter: Chapter?
//    @Binding var selectedBook: Book?
//    @Binding var selectedVerse: Int?
//    
//    var chapters: [Chapter] {
//        bibleData.bible.books.flatMap { $0.chapters }
//        }
//    
//    var items: [KBar.Item] {
//        var items : [KBar.Item] = []
//        
//        for chapter in chapters {
//            let item = KBar.Item(title: chapter.name) {
//                selectedChapter = chapter
//                selectedVerse = 1
//            }
//            
//            items.append(item)
//        }
//        
//        return items
//    }
//    
//    var body: some View {
//        KBar(isActive: $showSwitchView, items: items)
//    }
//}
//
////#Preview {
////    QuickSwitcherView()
////}
//#endif
