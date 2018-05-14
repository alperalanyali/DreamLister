//
//  AppItem+CoreDataClass.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//
//

import Foundation
import CoreData

@objc(AppItem)
public class AppItem: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
        
    }
}
