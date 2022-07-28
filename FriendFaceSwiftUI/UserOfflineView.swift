//
//  UserOfflineView.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 27.07.2022.
//

import SwiftUI

struct UserOfflineView: View {
    @ObservedObject var users: UsersData
    
    var body: some View {
        NavigationLink {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text("**Age**: \(users.age)")
                    Text("**Address**: \(users.wrapAddress)")
                    Text("**Email**: \(users.wrapEmail)")
                    Divider()
                    Text("***About***:")
                    Text(users.wrapAbout)
                    Divider()
                    Text("***Friends***:")
                    ForEach(users.arrayFriend, id: \.wrapId) { user in
                        Text(user.wrapName)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 4)
            }

        } label: {
            VStack(alignment: .leading) {
                Text(users.wrapName)
                    .font(.title2.bold())
                Text("*Company:*  **'\(users.wrapCompany)'**")

                Divider()

                HStack {
                    Text("Registration:  \(users.wrapRegistered)")
                    Spacer()
                    Text(users.isActive ? "Active" : "Dis Active")
                        .foregroundColor(.red)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 4)
    }
}


struct UserOfflineView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
