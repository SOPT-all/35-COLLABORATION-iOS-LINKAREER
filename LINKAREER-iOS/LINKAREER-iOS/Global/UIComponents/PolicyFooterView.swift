//
//  policyFooterView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class PolicyFooterView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let lineView: UIView = UIView()
    
    private let termsOfServiceLabel: UILabel = UILabel()
    private let privacyPolicyLabel: UILabel = UILabel()
    private let contactUsLabel: UILabel = UILabel()
    
    private let labelStackView: UIStackView = UIStackView()
    
    private let copyrightLabel: UILabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHierarchy() {
        self.labelStackView.addArrangedSubviews(termsOfServiceLabel, privacyPolicyLabel, contactUsLabel)
        self.addSubviews(lineView, labelStackView, copyrightLabel)
    }
    
    func setLayout() {
        lineView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        copyrightLabel.snp.makeConstraints {
            $0.top.equalTo(labelStackView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.backgroundColor = .gray100
        
        lineView.backgroundColor = .gray300
        
        termsOfServiceLabel.do {
            $0.setLabel(text: "이용약관", textColor: .lkBlack, font: fontStyle.label6_m_10.font())
        }
    
        privacyPolicyLabel.do {
            $0.setLabel(text: "개인정보처리방침",textColor: .lkBlack, font: fontStyle.label6_m_10.font())
        }
        
        contactUsLabel.do {
            $0.setLabel(text: "고객문의",textColor: .lkBlack, font: fontStyle.label6_m_10.font())
        }
        
        labelStackView.do {
            $0.axis = .horizontal
            $0.spacing = 68
            $0.alignment = .bottom
        }
        
        copyrightLabel.do {
            $0.setLabel(text: "Copyright©Linkareer Inc. All Rights Reserved.",textColor: .gray400, font: fontStyle.body13_r_11.font())
        }
    }
    
}
