//
//  ChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import UIKit

import SnapKit
import Then


final class ChatCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private let otherChatView: OtherChatView = OtherChatView()
    private let myChatView: MyChatView = MyChatView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(otherChatView, myChatView)
    }
    
    func setLayout() {
        otherChatView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myChatView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


extension ChatCell {
    
    // 채팅이 내 채팅인지 상대 채팅인지 구분하여 보이기 설정
    func setChatVisible(isChatMine: Bool) {
        otherChatView.isHidden = isChatMine
        myChatView.isHidden = !isChatMine
    }
    
    // 공통된 채팅 설정을 위한 함수
    private func configureChatView(chat: Chat, likeButton: UIButton) {
        likeButton.setTitle("\(chat.likes)", for: .normal)
        let contentEdgeInsets = (chat.likes > 0) ? UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 5) : UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 1)
        likeButton.contentEdgeInsets = contentEdgeInsets
        
        if chat.pressedLike {
            likeButton.setImage(.icChattingLikeActive, for: .normal)
        }
    }

    // 내 채팅 설정
    func configureMyChat(chat: Chat) {
        myChatView.do {
            $0.messageLabel.setTitle(chat.message, for: .normal)
            configureChatView(chat: chat, likeButton: $0.likeButton)
        }
    }
    
    // 상대 채팅 설정
    func configureOtherChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else { return }
        
        otherChatView.do {
            $0.nicknameLabel.text = partner.partnerName
            $0.messageLabel.setTitle(chat.message, for: .normal)
            configureChatView(chat: chat, likeButton: $0.likeButton)
        }
        
        addTagButton(for: partner)
    }

    // 태그 버튼 추가
    func addTagButton(for partner: ChatPartner) {
        let tagButton: UIButton = UIButton()
        let tagText = partner.tag.companyName + "・" + partner.tag.job
        
        tagButton.setStyle(title: tagText)
        
        otherChatView.tagStackView.addArrangedSubview(tagButton)
        
        tagButton.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.greaterThanOrEqualTo(50)
        }
    }
    
}
