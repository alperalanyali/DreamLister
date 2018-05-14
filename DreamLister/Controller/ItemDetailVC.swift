//
//  ItemDetailVC.swift
//  DreamLister
//
//  Created by Alper on 14.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var storePicker: UIPickerView!
    var stores = [AppStore]()
    var itemToEdit: AppItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storePicker.delegate = self
        storePicker.dataSource = self
        // In the below, there are only test data
//        let bestBuy = AppStore(context: context)
//        bestBuy.name = "BestBuy"
//        let teslaDealer = AppStore(context: context)
//        teslaDealer.name = "Tesla Dealership"
//        let frysElectro = AppStore(context: context)
//        frysElectro.name = "Frys Electronics"
//        let target = AppStore(context: context)
//        target.name = "Target"
//        let amazon = AppStore(context: context)
//        amazon.name = "Amazon"
//        let kMart = AppStore(context: context)
//        kMart.name = "K Mart"
//        ad.saveContext()
        getStores()
        if itemToEdit != nil {
            loadItemData()
        }
        
    }

 
    //MARK: Functions about PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
        
    }
    func getStores(){
        let fetchRequest: NSFetchRequest<AppStore> = AppStore.fetchRequest()
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
    }
  
    @IBAction func savePressed(_ sender: UIButton) {
        let item: AppItem!
        if  itemToEdit == nil {
            item = AppItem(context: context)
        } else {
            item = itemToEdit
        }
        if let title = titleTextField.text{
            item.title = title
        }
        if let price = priceTextField.text {
            item.price = Double(price)!
        }
        if let detailts = detailsTextField.text {
            item.details = detailts
        }
        item.toStore =  stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        navigationController?.popViewController(animated:true)
    }
    func loadItemData(){
        if let item = itemToEdit {
            titleTextField.text = item.title
            priceTextField.text = String(item.price)
            detailsTextField.text = item.details
            if let store = item.toStore{
                var index = 0
                repeat {
                    let s = stores[index]
                    if  s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while index < stores.count
            }
        }
    }
    
}
