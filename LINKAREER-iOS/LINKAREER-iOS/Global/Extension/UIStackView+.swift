//
//  UIStackView+.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/17/24.
//

import UIKit

extension UIStackView {
    
    // UIStackView 여러 개 인자로 받아서 한 번에 addArrangedSubviews하는 메소드
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}


