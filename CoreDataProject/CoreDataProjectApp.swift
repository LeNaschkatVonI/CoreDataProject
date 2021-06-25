//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 26.06.2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
