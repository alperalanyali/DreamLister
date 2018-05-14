//
//  AppStore+CoreDataProperties.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//
//

import Foundation
import CoreData


extension AppStore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppStore> {
        return NSFetchRequest<AppStore>(entityName: "AppStore")
    }

    @NSManaged public var name: String?
    @NSManaged public var toImage: AppImage?
    @NSManaged public var toItem: NSSet?

}

// MARK: Generated accessors for toItem
extension AppStore {

    @objc(addToItemObject:)
    @NSManaged public func addToToItem(_ value: AppItem)

    @objc(removeToItemObject:)
    @NSManaged public func removeFromToItem(_ value: AppItem)

    @objc(addToItem:)
    @NSManaged public func addToToItem(_ values: NSSet)

    @objc(removeToItem:)
    @NSManaged public func removeFromToItem(_ values: NSSet)

}
