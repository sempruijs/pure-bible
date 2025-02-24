//
//  QuickSwitcherView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 24/02/2025.
//

import SwiftUI

struct QuickSwitcherView: View {
    @Binding var showSwitchView: Bool
    @Binding var searchText: String
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
                    TextField("Search Bible Book", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: .infinity)
                        .focused($isTextFieldFocused) // Bind to focus state
                        .onAppear {
                            isTextFieldFocused = true  // Automatically focus when view appears
                        }
                    
//                    List(filteredBooks, id: \.self) { book in
//                        Button(action: {
//                            self.selectedBook = book
//                            self.showSwitchView = false
//                        }) {
//                            Text(book)
//                                .padding()
//                        }
//                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 20)
                .frame(maxWidth: 400, maxHeight: 400)
                .transition(.move(edge: .top))
                .onAppear {
                    isTextFieldFocused = true
                }
                .onDisappear {
                    isTextFieldFocused = false
                }
                .onExitCommand {  // Handle Escape key press
                    showSwitchView = false
                }
    }
}

//#Preview {
//    QuickSwitcherView()
//}
