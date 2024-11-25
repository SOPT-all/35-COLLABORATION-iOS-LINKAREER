//
//  UITextField+.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/24/24.
//

import UIKit

extension UITextField {
    
    func setStyle(placeholder: String, font: UIFont = fontStyle.body12_r_12.font(), size: CGFloat = 13, backgroundColor: UIColor = UIColor(resource: .lkWhite), textColor: UIColor = .gray900, cornerRadius: CGFloat = 11, leftPadding: CGFloat = 11, borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftViewMode = .always
        self.textColor = textColor

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray600,
            .font: font
        ]
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
