//
//  Brew.swift
//  bean
//
//  Created by Anthony on 4/11/26.
//

import AcaiaSDK
import SwiftData
import SwiftUI

struct BrewView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var scaleMan: ScaleManager
    @Query private var containers: [ScaleContainer]

    var body: some View {
        VStack {
            Text("\(scaleMan.weight, specifier: "%.1f") g")
            Text("\(scaleMan.timerSeconds, specifier: "%.0f") s")
            VStack {
                Button(
                    "Tare",
                    action: {
                        scaleMan.tare()
                    }
                )
                .buttonStyle(.automatic)
                Button(
                    "Timer \(scaleMan.isTimerStarted ? "Stop" : "Start")",
                    action: {
                        scaleMan.timerButton()
                    }
                )
                .buttonStyle(.automatic)
                //                if scaleMan.isTimerStarted {
                //                    Button(
                //                        "Timer \(scaleMan.isTimerPaused ? "Continue" : "Pause")",
                //                        action: {
                //                            scaleMan.pauseTimer()
                //                        }
                //                    )
                //                    .buttonStyle(.automatic)
                //                }
                Button(
                    "Save Container",
                    action: {
                        let container = ScaleContainer(name: <#T##String#>, weight: <#T##Double#>)
                        scaleMan.saveContainer(container: container)
                    }
                )
                .buttonStyle(.automatic)
            }
            List {
                ForEach(containers) { container in
                    Text(
                        "\(container.name) - \(container.weight, specifier: "%.1f") g"
                    )
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Text("save")
            }
        }
    }
}
