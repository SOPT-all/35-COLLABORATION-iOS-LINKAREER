//
//  OtherReplyChatView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import UIKit

import SnapKit
import Then

class OtherReplyChatView: UIView {
    
    // MARK: - UI Properties
    
    private let profileImage: UIImageView = UIImageView(image: .imgProfileBear)
    let nicknameLabel: UILabel = UILabel()
    
    let tagStackView: UIStackView = UIStackView()
    private let checkBadge: UIImageView = UIImageView(image: .icCheckbadgeHomeInperson)
    
    private let chatBoxView: UIView = UIView()
    
    let replyNicknameLabel: UILabel = UILabel()
    let replyContentLabel: UILabel = UILabel()
    private let lineView: UIView = UIView()
    let messageLabel: UILabel = UILabel()
    
    private let writeTimeLabel: UILabel = UILabel()
    let likeButton: UIButton = UIButton()
    
    
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
        addSubviews(profileImage, nicknameLabel, tagStackView, chatBoxView, replyNicknameLabel, replyContentLabel, lineView, messageLabel, writeTimeLabel, likeButton)
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
        
        chatBoxView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(35)
            $0.width.equalTo(200)
        }
        
        replyNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(chatBoxView).inset(10)
            $0.horizontalEdges.equalTo(chatBoxView).inset(16)
        }
        
        replyContentLabel.snp.makeConstraints {
            $0.top.equalTo(replyNicknameLabel.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(chatBoxView).inset(16)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(replyContentLabel.snp.bottom).offset(6)
            $0.horizontalEdges.equalTo(chatBoxView).inset(16)
            $0.height.equalTo(1)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(6)
            $0.horizontalEdges.equalTo(chatBoxView).inset(16)
            $0.bottom.equalTo(chatBoxView).inset(10)
        }
        
        writeTimeLabel.snp.makeConstraints {
            $0.bottom.equalTo(chatBoxView)
            $0.leading.equalTo(chatBoxView.snp.trailing).offset(8)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(chatBoxView.snp.bottom).offset(4)
            $0.leading.equalTo(chatBoxView)
            $0.bottom.equalToSuperview().inset(13)
            $0.height.equalTo(26)
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
        
        chatBoxView.do {
            $0.backgroundColor = .blue50
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        replyNicknameLabel.do {
            $0.setLabel( alignment: .left, textColor: .gray900, font: fontStyle.body3_b_13.font())
        }
        
        replyContentLabel.do {
            $0.setLabel(alignment: .left, textColor: .gray600, font: fontStyle.body12_r_12.font())
        }
        
        lineView.backgroundColor = .gray300
        
        messageLabel.do {
            $0.setLabel(alignment: .left, textColor: .gray900, font: fontStyle.body10_r_14.font())
        }
        
        writeTimeLabel.do {
            $0.setLabel(text: "00:00",textColor: .gray600, font: fontStyle.body13_r_11.font())
        }
        
        likeButton.do {
            $0.setImage(.icChattingLike, for: .normal)
            $0.titleLabel?.font = fontStyle.body13_r_11.font()
            $0.setTitleColor(.gray700, for: .normal)
            $0.layer.cornerRadius = 13
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 1)
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
        }
        
    }
}
    
   

