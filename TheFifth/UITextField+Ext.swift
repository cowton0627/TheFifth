//
//  UITextField+Ext.swift
//  TheFifth
//
//  Created by Chun-Li Cheng on 2021/11/28.
//

import Foundation
import UIKit

extension UITextField {
    
    func createDatepicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "Chinese")
        // Added condition for iOS 14
        if #available(iOS 14, *) {
          datePicker.preferredDatePickerStyle = .wheels
          datePicker.sizeToFit()
        }
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
        let toorbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toorbar.setItems([cancelBtn, flexible, doneBtn], animated: true)
        self.inputAccessoryView = toorbar
        
    }
    
    @objc func cancelTapped() {
        self.resignFirstResponder()
    }
}
