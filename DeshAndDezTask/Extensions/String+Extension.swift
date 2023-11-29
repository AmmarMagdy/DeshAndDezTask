//
//  String+Extension.swift
//  DeshAndDezTask
//
//  Created by Ammar Magdy on 29/11/2023.
//

import UIKit

extension String {
    
    func calculateWidth(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}
