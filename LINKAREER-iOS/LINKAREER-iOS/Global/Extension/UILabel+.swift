//
//  UILabel+.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/17/24.
//

import UIKit

extension UILabel {
    
    // 기본 UILabel 속성 설정 메소드
    func setLabel(text: String? = "", alignment: NSTextAlignment = .center, numberOfLines: Int = 0, textColor: UIColor, font: UIFont) {
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = font
    }
    
}
