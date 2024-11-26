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
    
    func setChatVisible(isChatMine: Bool) {
        otherChatView.isHidden = isChatMine
        myChatView.isHidden = !isChatMine
    }
    
    private func configureChatView(chat: Chat, likeButton: UIButton) {
        let likeTitle = (chat.likes == 0) ? nil : "\(chat.likes)"
        likeButton.setTitle(likeTitle, for: .normal)
        
        let contentEdgeInsets = (chat.likes > 0) ? UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 5) : UIEdgeInsets(top: 4, left: 5, bottom: 4, right: 1)
        likeButton.contentEdgeInsets = contentEdgeInsets
        
        if chat.pressedLike {
            likeButton.setImage(.icChattingLikeActive, for: .normal)
        }
    }

    func configureMyChat(chat: Chat) {
        myChatView.do {
            $0.messageLabel.setTitle(chat.message, for: .normal)
            configureChatView(chat: chat, likeButton: $0.likeButton)
        }
    }
    
    func configureOtherChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else { return }
        
        otherChatView.do {
            $0.nicknameLabel.text = partner.partnerName
            $0.messageLabel.setTitle(chat.message, for: .normal)
            configureChatView(chat: chat, likeButton: $0.likeButton)
        }
        
        addTagButton(for: partner)
    }

    private func addTagButton(for partner: ChatPartner) {
        otherChatView.tagStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

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

