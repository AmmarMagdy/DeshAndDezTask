//
//  LabelCollectionViewCell.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var label: UILabel!
    
    func set(text: String) {
        label.text = text
    }
    
    func select() {
        label.textColor = .primaryColor()
    }
    
    func deselect() {
        label.textColor = .white
    }
}
