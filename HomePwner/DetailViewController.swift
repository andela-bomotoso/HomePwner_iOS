//
//  DetailViewController.swift
//  HomePwner
//
//  Created by BUKOLA OMOTOSO on 29/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
class DetailViewController:UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!

    @IBOutlet var valueField: UITextField!


    @IBOutlet var dateLabel: UILabel!
  
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takepicture(sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera)   {
            imagePicker.sourceType = .Camera
        }   else    {
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
       
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageStore.setImage(image, forKey: item.itemKey)
         dismissViewControllerAnimated(true, completion: nil)
    }
    
       @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }

    var item: Item! {
        didSet  {
         navigationItem.title = item.name
        }
    }
    var imageStore : ImageStore!
    
    
    let numberFormatter : NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter : NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
        
        let key = item.itemKey
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
    }
    
    // MARK: - 
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        item.name = nameField.text!
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text, value = numberFormatter.numberFromString(valueText) {
            item.valueInDollars = value.integerValue
        }   else    {
            item.valueInDollars = 0
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
