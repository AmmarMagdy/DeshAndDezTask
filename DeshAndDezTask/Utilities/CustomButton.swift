//
//  CustomButton.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var isRounded: Bool = false {
        didSet {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    @IBInspectable var cornerRadius: Float {
        get {
            layer.masksToBounds = true
            
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
}
