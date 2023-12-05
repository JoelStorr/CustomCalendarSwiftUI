//
//  CalanderTestApp.swift
//  CalanderTest
//
//  Created by Joel Storr on 05.12.23.
//

import SwiftUI

@main
struct CalanderTestApp: App {
    var body: some Scene {
        WindowGroup {
            
            let dateHolder = DateHolder()
            
            ContentView()
                .environmentObject(dateHolder)
        }
    }
}
