//
//  CustomImageView.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

@IBDesignable class CustomImageView: UIImageView {
   
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
