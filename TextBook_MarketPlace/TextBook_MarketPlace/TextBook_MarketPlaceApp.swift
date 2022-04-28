//
//  TextBook_MarketPlaceApp.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI
import Firebase

@main
struct TextBook_MarketPlaceApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
