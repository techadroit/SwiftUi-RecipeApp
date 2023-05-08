//
//  SwiftUIRecipeAppApp.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 28/01/22.
//

import SwiftUI

@main
struct SwiftUIRecipeAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var navigationCoordinator = MainNavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationCoordinator)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}
