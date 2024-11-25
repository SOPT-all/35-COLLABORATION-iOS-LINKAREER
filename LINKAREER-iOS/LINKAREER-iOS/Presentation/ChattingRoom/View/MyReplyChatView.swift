//
//  MyReplyChatView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import UIKit

import SnapKit
import Then

class MyReplyChatView: UIView {
    
    // MARK: - UI Properties
    
    private let chatBoxView: UIView = UIView()
    
    let replyNicknameLabel: UILabel = UILabel()
    let replyContentLabel: UILabel = UILabel()
    private let lineView: UIView = UIView()
    let messageLabel: UILabel = UILabel()
    
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
        addSubviews(chatBoxView, replyNicknameLabel, replyContentLabel, lineView, messageLabel, writeTimeLabel, likeButton)
    }
    
    func setLayout() {
        
        chatBoxView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
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
            $0.trailing.equalTo(chatBoxView.snp.leading).offset(-8)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(chatBoxView.snp.bottom).offset(4)
            $0.trailing.equalTo(chatBoxView)
            $0.bottom.equalToSuperview().inset(13)
            $0.size.equalTo(25)
        }
    }
    
    func setStyle() {

        chatBoxView.do {
            $0.backgroundColor = .blue50
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        replyNicknameLabel.do {
            $0.setLabel( alignment: .right, textColor: .gray900, font: fontStyle.body3_b_13.font())
        }
        
        replyContentLabel.do {
            $0.setLabel(alignment: .right, textColor: .gray600, font: fontStyle.body12_r_12.font())
        }
        
        lineView.backgroundColor = .gray300
        
        messageLabel.do {
            $0.setLabel(alignment: .right, textColor: .gray900, font: fontStyle.body10_r_14.font())
        }
        
        writeTimeLabel.do {
            $0.setLabel(text: "00:00",textColor: .gray600, font: fontStyle.body13_r_11.font())
        }
        
        likeButton.do {
            $0.setImage(.icChattingLike, for: .normal)
        }
        
    }
}
    
   


