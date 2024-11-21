//
//  ChatListCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

import Then
import SnapKit

final class ChatListCollectionViewCell: UICollectionViewCell {
    
    private let thumbnailImageView: UIImageView = UIImageView()
    
    private let firstTagLabel: UILabel = UILabel()
    private let secondTagLabel: UILabel = UILabel()
    private let thirdTagLabel: UILabel = UILabel()
    private let tagStackView: UIStackView = UIStackView()
    
    private let companyTitleLabel: UILabel = UILabel()
    private let chatTitleLabel: UILabel = UILabel()
    
    private let chatParticipantLabel: UILabel = UILabel()
    private let divideLineView: UIView = UIView()
    private let statusButton: UIButton = UIButton()
    
    
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


extension ChatListCollectionViewCell {
    func setHierarchy() {
        tagStackView.addArrangedSubviews(firstTagLabel, secondTagLabel, thirdTagLabel)
        addSubviews(thumbnailImageView, tagStackView, companyTitleLabel, chatTitleLabel, chatParticipantLabel, divideLineView, statusButton)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(97)
            $0.width.equalTo(347)
        }
      
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(12)
            $0.size.equalTo(74)
        }
        
        tagStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
        }
        
        companyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(tagStackView.snp.bottom).offset(6)
            $0.leading.equalTo(tagStackView)
        }
        
        chatTitleLabel.snp.makeConstraints {
            $0.top.equalTo(companyTitleLabel.snp.bottom)
            $0.leading.equalTo(tagStackView)
        }
        
        chatParticipantLabel.snp.makeConstraints {
            $0.top.equalTo(chatTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(tagStackView)
        }
        
        divideLineView.snp.makeConstraints {
            $0.top.equalTo(chatParticipantLabel)
            $0.leading.equalTo(chatParticipantLabel.snp.trailing).offset(6)
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        statusButton.snp.makeConstraints {
            $0.top.equalTo(chatParticipantLabel)
            $0.leading.equalTo(divideLineView.snp.trailing).offset(6)
        }
    }
    
    func setStyle() {
        self.do {
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = .gray100
        }
        
        [firstTagLabel, secondTagLabel, thirdTagLabel].forEach {
            $0.do {
                $0.textColor = .gray900
                $0.font = fontStyle.label7_m_9.font()
                $0.layer.cornerRadius = 4
                $0.backgroundColor = .white
            }
        }
        
        tagStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fillEqually
        }
        
        companyTitleLabel.do {
            $0.font = fontStyle.label6_m_10.font()
            $0.textColor = .gray600
        }
        
        chatTitleLabel.do {
            $0.font = fontStyle.body3_b_13.font()
            $0.textColor = .gray900
        }
        
        chatParticipantLabel.do {
            $0.font = fontStyle.label7_m_9.font()
            $0.textColor = .gray600
        }
        
        divideLineView.do {
            $0.backgroundColor = .gray300
        }
        
        statusButton.do {
            $0.setTitle("현직자 대화중", for: .normal)
            $0.titleLabel?.font = fontStyle.label7_m_9.font()
            $0.setImage(.icCheckbadgeHomeInperson, for: .normal)
            $0.tintColor = .lkBlue
            $0.setTitleColor(.lkBlue, for: .normal)
            $0.backgroundColor = .clear
        }
    }
}

extension ChatListCollectionViewCell {
    func configure(data: ChatList) {
        thumbnailImageView.image = data.thumbnailImage
        firstTagLabel.text = data.firstTagLabel
        secondTagLabel.text = data.secondTagLabel
        thirdTagLabel.text = data.thirdTagLabel
        companyTitleLabel.text = data.companyLabel
        chatTitleLabel.text = data.chatTitleLabel
        chatParticipantLabel.text = data.chatParticipantLabel
    }
}
