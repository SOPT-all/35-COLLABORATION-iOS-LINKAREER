//
//  OtherChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then


final class ReplyChatCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private let otherReplyChatView: OtherReplyChatView = OtherReplyChatView()
    private let myReplyChatView: MyReplyChatView = MyReplyChatView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(otherReplyChatView, myReplyChatView)
    }
    
    func setLayout() {
        otherReplyChatView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myReplyChatView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


extension ReplyChatCell {
    
    // 채팅 뷰 보이기 설정
    func setChatVisible(isChatMine: Bool) {
        otherReplyChatView.isHidden = isChatMine
        myReplyChatView.isHidden = !isChatMine
    }
    
    // 채팅 유형에 맞게 설정
    func configureChatView(for chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureChatView(chat: chat, isMyChat: true)
        } else {
            configureChatView(chat: chat, isMyChat: false, partner: partner)
        }
    }
    
    // 공통된 채팅 설정을 위한 함수
    private func configureChatView(chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureMyChat(chat: chat)
        } else {
            configureOtherChat(partner: partner, chat: chat)
        }
    }
    
    // 내 채팅 설정
    func configureMyChat(chat: Chat) {
        myReplyChatView.do {
            $0.replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
            $0.replyContentLabel.text = chat.reply?.replyMessage
            $0.messageLabel.text = chat.message
            configureLikeButton($0.likeButton, likes: chat.likes, isPressed: chat.pressedLike)
        }
    }
    
    // 상대 채팅 설정
    func configureOtherChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else { return }

        otherReplyChatView.do {
            $0.nicknameLabel.text = partner.partnerName
            $0.replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
            $0.replyContentLabel.text = chat.reply?.replyMessage
            $0.messageLabel.text = chat.message
            configureLikeButton($0.likeButton, likes: chat.likes, isPressed: chat.pressedLike)
        }

        addTagButton(for: partner)
    }
    
    // 좋아요 버튼 설정
    private func configureLikeButton(_ likeButton: UIButton, likes: Int, isPressed: Bool) {
        likeButton.setTitle("\(likes)", for: .normal)
        if likes > 0 {
            likeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 5)
        } 
        
        if isPressed {
            likeButton.setImage(.icChattingLikeActive, for: .normal)
        }
    }
    
    // 태그 버튼 추가
    private func addTagButton(for partner: ChatPartner) {
        let tagButton: UIButton = UIButton()
        let tagText = partner.tag.companyName + "・" + partner.tag.job
        tagButton.setStyle(title: tagText)
        
        otherReplyChatView.tagStackView.addArrangedSubview(tagButton)
        
        tagButton.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.greaterThanOrEqualTo(50)
        }
    }
}
