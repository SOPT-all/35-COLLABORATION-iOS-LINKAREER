//
//  SeparatorView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/21/24.
//

import UIKit

// for CompanyBigCardCell
class SeparatorView: UIView {
    
    init(axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        self.backgroundColor = .gray200
        
        if axis == .vertical {
            self.snp.makeConstraints { make in
                make.width.equalTo(1)
            }
        } else {
            self.snp.makeConstraints { make in
                make.height.equalTo(1)
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
