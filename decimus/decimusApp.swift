//
//  decimusApp.swift
//  decimus
//
//  Created by William Kitay on 11/13/21.
//

import SwiftUI

@main
struct decimusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
