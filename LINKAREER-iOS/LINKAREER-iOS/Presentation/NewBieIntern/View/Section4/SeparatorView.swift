//
//  SeparatorView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/21/24.
//

import UIKit
import SnapKit
// for CompanyBigCardCell
class SeparatorView: UIView {
    
    init(axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        self.backgroundColor = .gray200
        //경고 이유 : 삼항으로 반은 값을 활용하지 않음 -> 더 정확히는 snapkit의 속성인 chaining을 사용하지 않아서 인데 여기서는 굳이 chaining을 사용하지 않아도 되기에 경고 무시해도 상괸없음.
        self.snp.makeConstraints {
            axis == .vertical ? $0.width.equalTo(1) : $0.height.equalTo(1)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
