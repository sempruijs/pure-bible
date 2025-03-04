//
//  ChapterView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 23/02/2025.
//

import SwiftUI

struct ChapterView: View {
    let chapter: Chapter
    @AppStorage("showVerseNumbers") private var showVerseNumbers = true
    @AppStorage("fontSize") private var fontSize: Double = 12.0
    @AppStorage("fontName") private var fontName: String = "System"
    @Binding var selectedVerse: Int?
    
    @AccessibilityFocusState private var focus: Int?

    var body: some View {
            ScrollView {
                HStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 8) {  // Added spacing between verses
                        ForEach(chapter.verses, id: \.verse) { verse in
                            Text(showVerse(verse: verse, withNumber: showVerseNumbers))
                                .font(
                                    fontName == "System"
                                    ? .system(.body, design: .serif)  // Serif for better readability
                                    : .custom(fontName, size: 17, relativeTo: .body)
                                )
                                .tracking(0.5)  // Slight character spacing for clarity
                                .lineSpacing(6)  // Improves readability
                                .multilineTextAlignment(.leading)  // Align text left
                                .frame(maxWidth: 600, alignment: .leading)  // Limit width for readability
                                .padding(.bottom, 6)
                                .textSelection(.enabled)
                                .accessibilityFocused($focus, equals: verse.verse)
                        }
                    }
                    .padding()
                    .padding(.bottom, 100) 
                    Spacer()
                }
            }
            .navigationTitle("\(chapter.name)")
            .accessibilityLabel("\(chapter.name)")
            .dynamicTypeSize(.medium ... .xxLarge)  // Supports system-wide text scaling
            
#if os(iOS)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        settings.verseNumbers.toggle()  // Toggle verse number visibility
                    }) {
                        Image(systemName: "number.circle")
                            .imageScale(.small)
                    }
                    .accessibilityLabel(settings.verseNumbers ? "Hide verse numbers" : "Show verse numbers")
                }
            }
#endif
    }
}
func showVerse(verse: Verse, withNumber: Bool) -> String {
    if withNumber {
        return "\(verse.verse). \(verse.text)"
    }
    return "\(verse.text)"
}


//#Preview {
//    ChapterView()
//}
