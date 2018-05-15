//
//  ItemDetailVC.swift
//  DreamLister
//
//  Created by Alper on 14.05.2018.
//  Copyright © 2018 Alper. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    //MARK: Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var thumgimage: UIImageView!
    // MARK: Variables
    var stores = [AppStore]()
    var itemToEdit: AppItem?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        storePicker.delegate = self
        storePicker.dataSource = self
      
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        

     
        createStore()
        ad.saveContext()
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
  
    func getStores(){
        let fetchRequest: NSFetchRequest<AppStore> = AppStore.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        } catch {
            let error = NSError()
                print(error)
        }
    }
  
    @IBAction func savePressed(_ sender: UIButton) {
        var item: AppItem!
        let picture = AppImage(context: context)
        picture.itemimage = thumgimage.image
        
        if  itemToEdit == nil {
            item = AppItem(context: context)
        } else {
            item = itemToEdit
        }
        item.toImage = picture
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
            thumgimage.image = item.toImage?.itemimage as? UIImage
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
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if  itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumgimage.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }



    func createStore() {
        let bestBuy = AppStore(context: context)
                bestBuy.name = "BestBuy"
                let teslaDealer = AppStore(context: context)
                teslaDealer.name = "Tesla Dealership"
                let frysElectro = AppStore(context: context)
                frysElectro.name = "Frys Electronics"
                let target = AppStore(context: context)
                target.name = "Target"
                let amazon = AppStore(context: context)
                amazon.name = "Amazon"
                let kMart = AppStore(context: context)
                kMart.name = "K Mart"
        
    }
    
    }






