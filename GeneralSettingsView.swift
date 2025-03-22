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
            Section("Preferences") {
                Toggle("Show verse numbers", isOn: $showVerseNumbers)
                
                Picker("Font Face", selection: $fontName) {
                    Text("System").tag("System")
                    Text("Times New Roman").tag("Times New Roman")
                    Text("Georgia").tag("Georgia")
                    Text("Arial").tag("Arial")
                }
                .pickerStyle(.menu)
                
                Slider(value: $fontSize, in: 9...96) {
                    Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
                }
            }
            
            Section {
                Link(destination: URL(string: "https://github.com/sempruijs/pure-bible")!) {
                    Label("Visit GitHub Repository", systemImage: "link")
                        #if os(iOS)
                        .font(.body)
                        #endif
                }
            }
            
            Section {
                Text("Thank you for using Pure Bible ❤️\nVersion \(Bundle.main.appVersion)")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(.secondary)
            }
        }
        #if os(macOS)
        .formStyle(.grouped)  // Better macOS styling
        .frame(minWidth: 450, minHeight: 400)
        #else
        .navigationTitle("Settings")
        #endif
    }
}

// Add this extension outside the struct for version info
extension Bundle {
    var appVersion: String {
        (infoDictionary?["CFBundleShortVersionString"] as? String) ?? "1.0"
    }
}
