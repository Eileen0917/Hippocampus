//
//  UserData+CoreDataProperties.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/2.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var uname: String?
    @NSManaged public var own: NSSet?

}

// MARK: Generated accessors for own
extension UserData {

    @objc(addOwnObject:)
    @NSManaged public func addToOwn(_ value: Diary)

    @objc(removeOwnObject:)
    @NSManaged public func removeFromOwn(_ value: Diary)

    @objc(addOwn:)
    @NSManaged public func addToOwn(_ values: NSSet)

    @objc(removeOwn:)
    @NSManaged public func removeFromOwn(_ values: NSSet)

}
