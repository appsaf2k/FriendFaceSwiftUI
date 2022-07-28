//
//  GirdLayoutView.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 27.07.2022.
//

import SwiftUI

struct GirdLayoutView: View {
    @State var showingAddScreen = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<UsersData>
    @FetchRequest(sortDescriptors: []) var friend: FetchedResults<FriendsData>
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(user, id: \.id) { user in
                        UserOfflineView(users: user)
                            .listRowSeparator(.hidden)
                        
                    }
                    .onDelete(perform: removeUser)
                }
                .listStyle(.plain)
                .navigationTitle("Contacts in phone")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Добавить Книгу", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddView()
                }
                
            }
        }
    }
    
    // удаление объекта из Core Data
    func removeUser(at offsets: IndexSet) {
        for index in offsets {
            let user = user[index]
            let friend = friend[index]
            moc.delete(friend)
            moc.delete(user)
        }
        // моментальное сохранение при удалении
        do {
            try moc.save()
        } catch {
            // обработка ошибки при ее возникновении
            let nsError = error as NSError
            fatalError("Core Data error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct GirdLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GirdLayoutView()
    }
}
