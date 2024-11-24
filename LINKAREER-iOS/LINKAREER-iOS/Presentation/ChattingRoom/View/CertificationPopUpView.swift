//
//  CertificationPopUpView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class CertificationPopUpView: UIView {
    
    // MARK: - UI Properties
    
    private let certificationIcon: UIImageView = UIImageView(image: .icCertification)
    
    let certificationButton: UIButton = UIButton()
    private let subLabel: UILabel = UILabel()
    
    let closeButton: UIButton = UIButton()
    
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
        self.addSubviews(certificationIcon, certificationButton, subLabel, closeButton)
    }
    
    func setLayout() {
        certificationIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.size.equalTo(24)
        }
        
        certificationButton.snp.makeConstraints {
            $0.centerY.equalTo(certificationIcon)
            $0.leading.equalTo(certificationIcon.snp.trailing).offset(4)
        }
        
        subLabel.snp.makeConstraints {
            $0.centerY.equalTo(certificationIcon)
            $0.leading.equalTo(certificationButton.snp.trailing)
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(24)
        }
        
    }
    
    func setStyle() {
        self.do {
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray200.cgColor
        }
        certificationButton.do {
            $0.setTitle("합불인증", for: .normal)
            $0.titleLabel?.font = fontStyle.body9_m_12.font()
            $0.setTitleColor(.lkBlue, for: .normal)
        }
        
        subLabel.do {
            $0.setLabel(text: "을 거쳐 대화의 신회도를 높여보세요", textColor: .gray700, font: fontStyle.body9_m_12.font())
        }
        
        closeButton.setImage(.icClose, for: .normal)
    }
    
}




