//
//  ContentView.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 23.07.2022.
//
import CoreData
import SwiftUI
import Foundation


struct ContentView: View {
    @StateObject private var url = UrlSessions()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(url.users, id: \.id) { user in
                        UserView(user: user)
                            .listRowSeparator(.hidden)
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Contacts in cloud")
                
            }
            .task {
                await url.fetchUser()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
    }
}
