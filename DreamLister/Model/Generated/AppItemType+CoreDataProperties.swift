//
//  AppItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//
//

import Foundation
import CoreData


extension AppItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppItemType> {
        return NSFetchRequest<AppItemType>(entityName: "AppItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: AppItem?

}
