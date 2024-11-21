//
//  ChatCertificationInitialCell.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class ChatCertificationInitialCell: UICollectionViewCell {

    // MARK: - UI Components
    
    private let mainLabel: UILabel = UILabel()
    private let subLabel: UILabel = UILabel()
    private let iconImageView: UIImageView = UIImageView()
    
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

extension ChatCertificationInitialCell {
    func setHierarchy() {
        addSubviews(mainLabel, subLabel, iconImageView)
    }
    
    func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(4)
            $0.leading.equalTo(mainLabel)
        }
        
    }
    
    func setStyle() {
        backgroundColor = .gray100
        
        self.do {
            $0.layer.cornerRadius = 8
        }
        
        mainLabel.do {
            $0.font = fontStyle.body3_b_13.font()
            $0.textColor = .gray900
            $0.textAlignment = .center
        }
        
        subLabel.do {
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
            $0.textAlignment = .center
        }
    }
}

extension ChatCertificationInitialCell {
    func configure(with data: CertificationInitialList) {
        mainLabel.text = data.mainText
        subLabel.text = data.subText
        iconImageView.image = data.iconImage
    }
}
