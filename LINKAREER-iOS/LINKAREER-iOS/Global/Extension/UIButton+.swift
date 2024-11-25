//
//  UIButton+.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/24/24.
//

import UIKit

extension UIButton {
    
    func setStyle(title: String,
                            titleColor: UIColor = .lkBlue,
                            backgroundColor: UIColor = .blue50,
                            font: UIFont = fontStyle.label7_m_9.font(),
                            cornerRadius: CGFloat = 4,
                            contentEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 4.5, left: 5, bottom: 4.5, right: 5)) {
        
        self.do {
            $0.setTitle(title, for: .normal)
            $0.titleLabel?.font = font
            $0.setTitleColor(titleColor, for: .normal)
            $0.backgroundColor = backgroundColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = cornerRadius
            $0.contentEdgeInsets = contentEdgeInsets
        }
    }
}

