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
    
    
    @available(*, unavailable)
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
    
    func setChatVisible(isChatMine: Bool) {
        otherReplyChatView.isHidden = isChatMine
        myReplyChatView.isHidden = !isChatMine
    }
    
    func configureChatView(for chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureMyChat(chat: chat)
        } else {
            configureOtherChat(partner: partner, chat: chat)
        }
    }
    
    func configureMyChat(chat: Chat) {
        myReplyChatView.replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
        myReplyChatView.replyContentLabel.text = chat.reply?.replyMessage
        myReplyChatView.messageLabel.text = chat.message
    }
    
    func configureOtherChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else {
            return
        }
        
        otherReplyChatView.do {
            $0.nicknameLabel.text = partner.partnerName
            $0.replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
            $0.replyContentLabel.text = chat.reply?.replyMessage
            $0.messageLabel.text = chat.message
        }
       
        addTagButton(for: partner)
    }

    func addTagButton(for partner: ChatPartner) {
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


