//
//  AppItem+CoreDataProperties.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//
//

import Foundation
import CoreData


extension AppItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppItem> {
        return NSFetchRequest<AppItem>(entityName: "AppItem")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var details: String?
    @NSManaged public var toImage: AppImage?
    @NSManaged public var toItemType: AppItemType?
    @NSManaged public var toStore: AppStore?

}
