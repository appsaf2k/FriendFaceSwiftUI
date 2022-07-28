//
//  FriendFaceSwiftUIApp.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 23.07.2022.
//

import SwiftUI
import CloudKit

@main
struct FriendFaceSwiftUIApp: App {
    // загружаем DataController при запуске приложения
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
           
                ContentView()
                    
                GirdLayoutView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
         
            // загружаем DataController при запуске приложения
                
        }
    }
}
