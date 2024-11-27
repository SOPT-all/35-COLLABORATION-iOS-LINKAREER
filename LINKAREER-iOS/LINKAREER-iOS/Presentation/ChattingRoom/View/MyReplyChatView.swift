//
//  ChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import UIKit

import SnapKit
import Then


final class MyChatCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private let chatBoxView: UIView = UIView()
    
    private let replyNicknameLabel: UILabel = UILabel()
    private let replyContentLabel: UILabel = UILabel()
    private let lineView: UIView = UIView()
    private let messageLabel: UILabel = UILabel()
    
    let writeTimeLabel: UILabel = UILabel()
    let likeButton: UIButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            $0.top.equalTo(chatBoxView).inset(68)
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
            $0.height.equalTo(26)
        }
    }
    
    func setStyle() {
        chatBoxView.do {
            $0.backgroundColor = .blue50
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        replyNicknameLabel.do {
            $0.setLabel( alignment: .left, textColor: .gray900, font: fontStyle.body3_b_13.font())
        }
        
        replyContentLabel.do {
            $0.setLabel(alignment: .left, numberOfLines: 1, textColor: .gray600, font: fontStyle.body12_r_12.font())
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

extension MyChatCell {
    
    func isChatReply(chat: Chat) {
        if !chat.isReplied {
            replyNicknameLabel.isHidden = true
            replyContentLabel.isHidden = true
            lineView.isHidden = true

            messageLabel.snp.remakeConstraints {
                $0.top.equalTo(chatBoxView).inset(10)
                $0.horizontalEdges.equalTo(chatBoxView).inset(16)
                $0.bottom.equalTo(chatBoxView).inset(10)
            }
        }
    }
    
    func configureChat(chat: Chat) {
        
        replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
        replyContentLabel.text = chat.reply?.replyMessage
        messageLabel.text = chat.message
        configureLikeButton(likeButton, likes: chat.likes, isPressed: chat.pressedLike)
        
    }
    
    private func configureLikeButton(_ likeButton: UIButton, likes: Int, isPressed: Bool) {
        let likeTitle = (likes == 0) ? nil : "\(likes)"
        
        let rightInset: CGFloat = (likes > 0) ? 5 : 1
        likeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: rightInset)
        likeButton.setTitle(likeTitle, for: .normal)
        
        // 좋아요가 눌렸으면 아이콘을 활성화된 상태로 변경
        if isPressed {
            likeButton.setImage(.icChattingLikeActive, for: .normal)
        }
    }
}
