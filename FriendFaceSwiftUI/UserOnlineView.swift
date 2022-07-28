//
//  UserView.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 24.07.2022.
//
import Foundation
import CoreData
import SwiftUI

struct UserView: View {
   @State var user: User
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<UsersData>

    
    var body: some View {
        NavigationLink {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text("**Age**: \(user.age)")
                    Text("**Address**: \(user.address)")
                    Text("**Email**: \(user.email)")
                    Divider()
                    Text("***About***:")
                    Text(user.about)
                    Divider()
                    Text("***Friends***:")
                    ForEach(user.friends, id: \.id) { user in
                        Text(user.name)

                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 4)
            }

        } label: {

            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title2.bold())
                Text("*Company:*  **'\(user.company)'**")

                Divider()

                HStack {
                    Text("Registration:  \(user.registered.convertToDate())")
                    Spacer()
                    Text(user.isActive ? "Active" : "Dis Active")
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


// conversion of string date received from .json
// преобразование стринговой даты полученной из .json
extension String {
  func convertToDate() -> String {
   
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      if let dt = dateFormatter.date(from: self) {
          dateFormatter.dateFormat = "yy/MM/dd"
          let formatedStringDate = dateFormatter.string(from: dt)
              return formatedStringDate
      }
      return "01/01/70"
  }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
