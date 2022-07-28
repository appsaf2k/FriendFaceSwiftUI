//
//  UsersData+CoreDataProperties.swift
//  FriendFaceSwiftUI
//
//  Created by @andreev2k on 27.07.2022.
//
//

import Foundation
import CoreData


extension UsersData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersData> {
        return NSFetchRequest<UsersData>(entityName: "UsersData")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?
    
    public var arrayFriend: [FriendsData] {
        let set = friends as? Set<FriendsData> ?? []
        return set.sorted {
            $0.wrapName < $1.wrapName
        }
    } 
    public var wrapId: UUID {
        id ?? UUID()
    }
    public var wrapAbout: String {
        about ?? "about"
    }
    public var wrapAddress: String {
        address ?? "address"
    }
    public var wrapCompany: String {
        company ?? "company"
    }
    public var wrapEmail: String {
        email ?? "email"
    }
    public var wrapName: String {
        name ?? "name"
    }
    public var wrapRegistered: String {
        registered ?? "registered"
    }
}

// MARK: Generated accessors for friends
extension UsersData {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendsData)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendsData)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension UsersData : Identifiable {

}
