//
//  LearningVibeApp.swift
//  LearningVibe
//
//  Created by Juan Farina on 31.10.25.
//

import SwiftUI
import CoreData

@main
struct LearningVibeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
