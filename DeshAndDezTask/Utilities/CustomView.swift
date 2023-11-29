//
//  CustomView.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    @IBInspectable var hasDashBorder: Bool = false
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0
    @IBInspectable var cornerRadiusDashed: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadiusDashed
            layer.masksToBounds = cornerRadius > 0
        }
    }
    var dashBorder: CAShapeLayer?
    
    @IBInspectable var color1: UIColor = .red {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable var color2: UIColor = .yellow {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // ------- add dashed border
        if hasDashBorder {
            dashBorder?.removeFromSuperlayer()
            let dashBorder = CAShapeLayer()
            dashBorder.lineWidth = dashWidth
            dashBorder.strokeColor = dashColor.cgColor
            dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
            dashBorder.frame = bounds
            dashBorder.fillColor = nil
            if cornerRadius > 0 {
                dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiusDashed).cgPath
            } else {
                dashBorder.path = UIBezierPath(rect: bounds).cgPath
            }
            layer.addSublayer(dashBorder)
            self.dashBorder = dashBorder
        }
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
    private var gradientLayer: CAGradientLayer!
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() -> Void {
        // use self.layer as the gradient layer
        gradientLayer = self.layer as? CAGradientLayer
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
    
}
