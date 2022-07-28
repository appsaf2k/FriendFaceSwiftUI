//
//  User.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 23.07.2022.
//

import Foundation
import SwiftUI
import CoreData



struct User: Codable {

    var id: String
    var name: String
    var isActive: Bool
    var address: String
    var about: String
    var company: String
    var email: String
    var age: Int
    var registered: String
    var tags: [String]
    var friends: [Friends]
}



struct Friends: Codable {
    var id: String
    var name: String
}
