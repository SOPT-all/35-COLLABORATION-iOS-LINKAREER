//
//  OtherChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

//
//  ReplyChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class ReplyChatCell: UITableViewCell {
    
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

    func setChatVisible(isChatMine: Bool) {
        otherReplyChatView.isHidden = isChatMine
        myReplyChatView.isHidden = !isChatMine
    }
    
    func configureChatView(for chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureChatView(chat: chat, isMyChat: true)
        } else {
            configureChatView(chat: chat, isMyChat: false, partner: partner)
        }
    }
    
    private func configureChatView(chat: Chat, isMyChat: Bool, partner: ChatPartner? = nil) {
        if isMyChat {
            configureMyChat(chat: chat)
        } else {
            configureOtherChat(partner: partner, chat: chat)
        }
    }
    
    func configureMyChat(chat: Chat) {
        myReplyChatView.do {
            $0.replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
            $0.replyContentLabel.text = chat.reply?.replyMessage
            $0.messageLabel.text = chat.message
            configureLikeButton($0.likeButton, likes: chat.likes, isPressed: chat.pressedLike)
        }
    }
    
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
    
    private func configureLikeButton(_ likeButton: UIButton, likes: Int, isPressed: Bool) {
        let likeTitle = (likes == 0) ? nil : "\(likes)"
        
        let rightInset: CGFloat = (likes > 0) ? 5 : 1
        likeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 5, bottom: 4, right: rightInset)
        
        // 좋아요 수를 버튼에 표시
        likeButton.setTitle(likeTitle, for: .normal)
        
        // 좋아요가 눌렸으면 아이콘을 활성화된 상태로 변경
        if isPressed {
            likeButton.setImage(.icChattingLikeActive, for: .normal)
        }
    }


    private func addTagButton(for partner: ChatPartner) {
        // 기존에 존재하는 tagButton이 있으면 삭제
        if let existingButton = otherReplyChatView.tagStackView.arrangedSubviews.first(where: { $0 is UIButton }) {
            existingButton.removeFromSuperview()
        }
        
        // 새로운 UIButton 생성
        let tagButton: UIButton = UIButton()
        let tagText = partner.tag.companyName + "・" + partner.tag.job
        tagButton.setStyle(title: tagText)
        
        // tagStackView에 추가
        otherReplyChatView.tagStackView.addArrangedSubview(tagButton)
        
        // UIButton의 크기 제약 추가
        tagButton.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.greaterThanOrEqualTo(50)
        }
    }

}
