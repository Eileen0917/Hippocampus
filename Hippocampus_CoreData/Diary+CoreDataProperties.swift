//
//  Diary+CoreDataProperties.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/2.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import Foundation
import CoreData


extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var comment: String?
    @NSManaged public var weather: String?
    @NSManaged public var location: String?
    @NSManaged public var tag: String?
    @NSManaged public var image: NSData?
    @NSManaged public var belong_to: UserData?

}
