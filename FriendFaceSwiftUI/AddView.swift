//
//  AddView.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 26.07.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var address = ""
    @State private var about = ""
    @State private var age = 18
    @State private var isActive = false
    @State private var company = ""
    @State private var email = ""
    @State private var registered = ""
    @State private var friend = ""
    
    // отключить сохранение при пустых полях
    var hashValid: Bool {
        if name.filter({!$0 .isWhitespace}).isEmpty || address.filter({!$0 .isWhitespace}).isEmpty || about.isEmpty || email.filter({!$0 .isWhitespace}).isEmpty {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nmae", text: $name)
                    TextField("Address", text: $address)
                    TextField("Company", text: $company)
                    
                    Picker("Age", selection: $age) {
                        ForEach(18..<60) {
                            Text("\($0)")
                        }
                    }
                    
                    TextField("Email", text: $email)
                    TextField("Date registered", text: $registered)
                    Toggle("Active", isOn: $isActive)
                }
                
                Section {
                    TextEditor(text: $about)
 
                } header: {
                    Text("About")
                }
                
                Section {
                    TextEditor(text: $friend)
 
                } header: {
                    Text("Friends")
                }
                
            }
            .navigationTitle("Add User")
            .toolbar {
                Button("Сохранить") {
                    // перечисляем данные для изменения
                    let newFriend = FriendsData(context: moc)
                    newFriend.name = friend
                    let newUser = UsersData(context: moc)
                    newUser.name = name
                    newUser.address = address
                    newUser.about = about
                    newUser.company = company
                    newUser.age = Int16(age)
                    newUser.email = email
                    newUser.registered = registered
                    newUser.isActive = isActive

                    // "if moc.hasChanges" записать наши изменения в "CoreData" только при изменении
                    if moc.hasChanges {
                        try? moc.save()
                    }
                    dismiss()
                }
                .padding()
                // отключить сохранение при пустых полях
                .disabled(hashValid == false)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
