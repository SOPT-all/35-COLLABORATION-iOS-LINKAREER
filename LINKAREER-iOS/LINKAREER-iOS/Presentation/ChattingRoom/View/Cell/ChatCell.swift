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
    
    
    @available(*, unavailable)
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
    
    func setChatVisible(isChatMine: Bool) {
        otherChatView.isHidden = isChatMine
        myChatView.isHidden = !isChatMine
    }
    
    func configureChatView(for chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureMyChat(chat: chat)
        } else {
            configureOtherChat(partner: partner, chat: chat)
        }
    }
    
    func configureMyChat(chat: Chat) {
        myChatView.messageLabel.setTitle(chat.message, for: .normal)
    }
    
    func configureOtherChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else {
            return
        }
        
        otherChatView.do {
            $0.nicknameLabel.text = partner.partnerName
            $0.messageLabel.setTitle(chat.message, for: .normal)
        }
       
        addTagButton(for: partner)
    }

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


