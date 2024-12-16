//
//  dopaMenuApp.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 09/12/24.
//

import SwiftUI
import SwiftData

@main
struct dopaMenuApp: App {
    var body: some Scene {
        WindowGroup {
            DopaMenuView()
                .modelContainer(for: Menu.self)
        }
    }
}
