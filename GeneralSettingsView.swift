//
//  GeneralSettingsView.swift
//  clean-bible
//
//  Created by Sem Pruijs on 03/03/2025.
//

import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage("showVerseNumbers") private var showVerseNumbers = true
    @AppStorage("fontSize") private var fontSize: Double = 12.0
    @AppStorage("fontName") private var fontName: String = "System"

    var body: some View {
        Form {
            Toggle("Show verse numbers", isOn: $showVerseNumbers)
//            Slider(value: $fontSize, in: 9...96) {
//                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
//            }
                Link("Visit github repository", destination: URL(string: "https://github.com/sempruijs/clean-bible")!)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
        }
        .frame(minWidth: 600, minHeight: 300)
    }
}
