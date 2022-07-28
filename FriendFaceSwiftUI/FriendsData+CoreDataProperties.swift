//
//  FriendsData+CoreDataProperties.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 27.07.2022.
//
//

import Foundation
import CoreData


extension FriendsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendsData> {
        return NSFetchRequest<FriendsData>(entityName: "FriendsData")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var users: UsersData?
    
    public var wrapId: String {
        id ?? UUID().uuidString
    }
    public var wrapName: String {
        name ?? "no name"
    }

}

extension FriendsData : Identifiable {

}
