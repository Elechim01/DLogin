//
//  DLoginApp.swift
//  DLogin
//
//  Created by Michele on 28/12/20.
//

import SwiftUI
import Firebase

@main
struct DLoginApp: App {
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class Delegate : NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
