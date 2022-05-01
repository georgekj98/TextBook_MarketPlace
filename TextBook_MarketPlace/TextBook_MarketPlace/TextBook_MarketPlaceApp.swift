//
//  TextBook_MarketPlaceApp.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import UIKit
import SwiftUI
import Firebase
import GoogleSignIn

@main
struct TextBook_MarketPlaceApp: App {
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .preferredColorScheme(.dark)
            LoginView()
                .environmentObject(SignUpViewModel())
                .preferredColorScheme(.dark)
            
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
