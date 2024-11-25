//
//  OtherChatView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class OtherChatView: UIView {
    
    // MARK: - UI Properties
    
    private let profileImage: UIImageView = UIImageView(image: .imgProfileBear)
    let nicknameLabel: UILabel = UILabel()
    
    let tagStackView: UIStackView = UIStackView()
    private let checkBadge: UIImageView = UIImageView(image: .icCheckbadgeHomeInperson)
    
    let messageLabel: UIButton = UIButton()
    
    private let writeTimeLabel: UILabel = UILabel()
    private let likeButton: UIButton = UIButton()
    
    
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
        tagStackView.addArrangedSubviews(checkBadge)
        addSubviews(profileImage, nicknameLabel, tagStackView, messageLabel, writeTimeLabel, likeButton)
    }
    
    func setLayout() {
        profileImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(27)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
        }
        
        checkBadge.snp.makeConstraints {
            $0.size.equalTo(22)
        }
        
        tagStackView.snp.makeConstraints {
            $0.centerY.equalTo(nicknameLabel)
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(8)
            $0.height.equalTo(22)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(tagStackView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(35)
        }
        
        writeTimeLabel.snp.makeConstraints {
            $0.bottom.equalTo(messageLabel)
            $0.leading.equalTo(messageLabel.snp.trailing).offset(8)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(4)
            $0.leading.equalTo(messageLabel)
            $0.bottom.equalToSuperview().inset(13)
            $0.size.equalTo(25)
        }
    }
    
    func setStyle() {
        nicknameLabel.do {
            $0.setLabel(text: "무심한 맥",textColor: .gray900, font: fontStyle.body4_b_12.font())
        }
        
        tagStackView.do {
            $0.alignment = .center
            $0.spacing = 2
        }
        
        messageLabel.do {
            $0.setStyle(title: "",titleColor: .gray900, font: fontStyle.body10_r_14.font(), cornerRadius: 8,
                        contentEdgeInsets: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
        }
        
        writeTimeLabel.do {
            $0.setLabel(text: "00:00",textColor: .gray600, font: fontStyle.body13_r_11.font())
        }
        
        likeButton.do {
            $0.setImage(.icChattingLike, for: .normal)
        }
        
    }
}
    
   

