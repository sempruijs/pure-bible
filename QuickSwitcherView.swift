//
//  QuickSwitcherView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 24/02/2025.
//

import SwiftUI

struct QuickSwitcherView: View {
    let bible: Bible
    @Binding var showSwitchView: Bool
    @Binding var searchText: String
    @FocusState private var isTextFieldFocused: Bool
    @State private var selectedIndex: Int = 0 // Track selected result index
    
    @Binding var selectedChapter: Chapter?
    @Binding var selectedBook: Book?

    var filteredChapters: [Chapter] {
        bible.books.flatMap { $0.chapters }.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        VStack {
            TextField("Search Bible Book", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
                .focused($isTextFieldFocused)
                .onAppear { isTextFieldFocused = true }

            List(filteredChapters, id: \.self, selection: $selectedIndex) { chapter in
                Button(action: {
//                    openChapter(filteredChapters[index])
                    selectedChapter = chapter
                    showSwitchView = false
                }) {
                    Text(chapter.name)
                        .padding()
//                        .background(selectedIndex == index ? Color.gray.opacity(0.2) : Color.clear)
                        .cornerRadius(5)
                }
            }
            .accessibilityLabel("search results")
            .onMoveCommand(perform: moveSelection)
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 20)
        .frame(maxWidth: 400, maxHeight: 400)
        .transition(.move(edge: .top))
        .onExitCommand { showSwitchView = false } // Hide on Escape
    }

    private func moveSelection(_ direction: MoveCommandDirection) {
        switch direction {
        case .down:
            if selectedIndex < filteredChapters.count - 1 { selectedIndex += 1 }
        case .up:
            if selectedIndex > 0 { selectedIndex -= 1 }
        default:
            break
        }
    }

    private func openChapter(_ chapter: Chapter) {
        showSwitchView = false
        // Navigate to the selected chapter (implement your navigation logic here)
    }
}

//#Preview {
//    QuickSwitcherView()
//}
