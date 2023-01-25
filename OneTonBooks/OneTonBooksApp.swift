//
//  OneTonBooksApp.swift
//  OneTonBooks
//
//  Created by 赤塚啓紀 on 2023/01/11.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

let bookUseCase = BookUseCaseImpl(bookRepository: FirestoreBookRepository())

@main
struct OneTonBooksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
