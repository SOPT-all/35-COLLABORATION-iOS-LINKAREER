//
//  EmptyView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

import Then
import SnapKit

final class EmptyView: UIView {
    
    private let mainLabel: UILabel = UILabel()
    private let subLabel: UILabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EmptyView {
    func setHierarchy() {
        addSubviews(mainLabel, subLabel)
    }
    
    func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(8)
        }
    }
    
    func setStyle() {
        self.do {
            $0.backgroundColor = .blue50
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        mainLabel.do {
            $0.text = "입장한 채팅방이 없습니다."
            $0.font = fontStyle.body9_m_12.font()
            $0.textColor = .gray800
        }
        
        subLabel.do {
            $0.text = "채팅방에 입장하여, 고민을 나눠보세요!"
            $0.font = fontStyle.body9_m_12.font()
            $0.textColor = .lkBlue
        }
    }
}
