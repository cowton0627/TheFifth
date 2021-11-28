//
//  ViewController.swift
//  TheFifth
//
//  Created by Chun-Li Cheng on 2021/11/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextField: MyTextField!
    
    let button: UIButton = {
        let screenWidth = UIScreen.main.bounds.width
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.setTitle("我是按鈕", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 50/2
        
        let action = UIAction { act in
            print("Hello World")
        }
        button.center = CGPoint(x: screenWidth/2, y: screenWidth/2)
        button.addAction(action, for: .touchUpInside)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
//        myTextField.leftViewMode = .always
//        myTextField.leftView = UIImageView(image: UIImage(systemName: "pencil"))
                
//        let screenWidth = UIScreen.main.bounds.width
//        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
//        datePicker.datePickerMode = .date
//        datePicker.locale = Locale(identifier: "Chinese")
//
//        if #available(iOS 14, *) {
//          datePicker.preferredDatePickerStyle = .wheels
//          datePicker.sizeToFit()
//        }
//
//        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
//        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
//        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDone))
//        toolBar.setItems([cancel, flexible, barButton], animated: false)
//        myTextField.inputAccessoryView = toolBar
//        myTextField.inputView = datePicker
        
        
        myTextField.createDatepicker(target: self, selector: #selector(doneTapped))

    }

    
    @objc func doneTapped() {
        if let datePicker = myTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            myTextField.text = dateFormatter.string(from: datePicker.date)
        }
        myTextField.resignFirstResponder()
    }
    
//    @objc func tapDone() {
//        myTextField.resignFirstResponder()
//    }
//    
//    @objc func tapCancel() {
//        myTextField.resignFirstResponder()
//    }

}

