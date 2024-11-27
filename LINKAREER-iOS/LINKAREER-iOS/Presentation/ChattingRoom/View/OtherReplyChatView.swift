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

final class OtherChatCell: UITableViewCell {
    
    private let profileImage: UIImageView = UIImageView(image: .imgProfileBear)
    private let nicknameLabel: UILabel = UILabel()
    
    private let tagStackView: UIStackView = UIStackView()
    private let checkBadge: UIImageView = UIImageView(image: .icCheckbadgeHomeInperson)
    
    private let chatBoxView: UIView = UIView()
    
    private let replyNicknameLabel: UILabel = UILabel()
    private let replyContentLabel: UILabel = UILabel()
    private let lineView: UIView = UIView()
    private let messageLabel: UILabel = UILabel()
    
    private let writeTimeLabel: UILabel = UILabel()
    private let likeButton: UIButton = UIButton()
    
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
        tagStackView.addArrangedSubviews(checkBadge)
        addSubviews(profileImage, nicknameLabel, tagStackView, chatBoxView, replyNicknameLabel, replyContentLabel, lineView, messageLabel, writeTimeLabel, likeButton)    }
    
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
            $0.top.equalTo(chatBoxView).inset(68)
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

extension OtherChatCell {
    
    
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
    
    func configureChat(partner: ChatPartner?, chat: Chat) {
        guard let partner = partner else { return }
        
        nicknameLabel.text = partner.partnerName
        replyNicknameLabel.text = "\(chat.reply?.repliedMessageSenderName ?? "") 님에게 답장"
        replyContentLabel.text = chat.reply?.replyMessage
        messageLabel.text = chat.message
        configureLikeButton(likeButton, likes: chat.likes, isPressed: chat.pressedLike)
        addTagButton(for: partner)
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
    
    
    private func addTagButton(for partner: ChatPartner) {
        // 기존에 존재하는 tagButton이 있으면 삭제
        if let existingButton = tagStackView.arrangedSubviews.first(where: { $0 is UIButton }) {
            existingButton.removeFromSuperview()
        }
        
        // 새로운 UIButton 생성
        let tagButton: UIButton = UIButton()
        let tagText = partner.tag.companyName + "・" + partner.tag.job
        tagButton.setStyle(title: tagText)
        
        // tagStackView에 추가
        tagStackView.addArrangedSubview(tagButton)
        
        // UIButton의 크기 제약 추가
        tagButton.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.greaterThanOrEqualTo(50)
        }
    }
}
