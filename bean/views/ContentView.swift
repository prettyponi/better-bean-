//
//  ContentView.swift
//  bean
//
//  Created by Anthony on 4/10/26.
//

import AcaiaSDK
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var scaleMan: ScaleManager
    @Query private var items: [Brew]

    var body: some View {
        TabView {
            ScaleView()
                .tabItem {
                    Label("Scale", systemImage: "house")
                }
            BrewView()
                .tabItem {
                    Label("Brew", systemImage: "cup.and.saucer.fill")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Setup", systemImage: "book.closed.fill")
                }
        }
    }
}
