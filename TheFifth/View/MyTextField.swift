//
//  MyTextField.swift
//  TheFifth
//
//  Created by Chun-Li Cheng on 2021/11/28.
//

import Foundation
import UIKit

class MyTextField: UITextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        leftViewMode = .always
        let lhsImageView = UIImageView(image: UIImage(systemName: "pencil"))
        lhsImageView.contentMode = .scaleAspectFit
        leftView = lhsImageView
        
        rightViewMode = .always
        let rhsImageView = UIImageView(image: UIImage(systemName: "calendar"))
        rhsImageView.contentMode = .scaleAspectFit
        rightView = rhsImageView
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let width = UIImage(systemName: "pencil")?.size.width ?? 0
        let height = UIImage(systemName: "pencil")?.size.height ?? 0
        return CGRect(x: 10, y: 10, width: width, height: height)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let width = UIImage(systemName: "calendar")?.size.width ?? 0
        let height = UIImage(systemName: "calendar")?.size.height ?? 0
        return CGRect(x: bounds.width - width - 10, y: 8, width: width, height: height)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
