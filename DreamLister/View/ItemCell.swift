//
//  ItemCell.swift
//  DreamLister
//
//  Created by Alper on 10.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var detail: UILabel!
    func configureCell(item: AppItem){
        title.text = item.title
        price.text = "$ \(item.price)"
        detail.text = item.details
    }
  
}
