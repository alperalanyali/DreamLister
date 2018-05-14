//
//  AppImage+CoreDataProperties.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//
//

import Foundation
import CoreData


extension AppImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppImage> {
        return NSFetchRequest<AppImage>(entityName: "AppImage")
    }

    @NSManaged public var itemimage: NSObject?
    @NSManaged public var toItem: AppItem?
    @NSManaged public var toStore: NSSet?

}

// MARK: Generated accessors for toStore
extension AppImage {

    @objc(addToStoreObject:)
    @NSManaged public func addToToStore(_ value: AppStore)

    @objc(removeToStoreObject:)
    @NSManaged public func removeFromToStore(_ value: AppStore)

    @objc(addToStore:)
    @NSManaged public func addToToStore(_ values: NSSet)

    @objc(removeToStore:)
    @NSManaged public func removeFromToStore(_ values: NSSet)

}
