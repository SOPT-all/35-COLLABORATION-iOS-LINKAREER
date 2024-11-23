//
//  ChatNavigationBarView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class ChatNavigationBarView: UIView {
    
    // MARK: - UI Properties
        
    private let backButton: UIButton = UIButton()
    
    let chatRoomNameLabel: UILabel = UILabel()
    let chatParticipantsCountLabel: UILabel = UILabel()
    
    private let searchButton: UIButton = UIButton()
    private let alarmButton: UIButton = UIButton()
    private let moreButton: UIButton = UIButton()
    
    private let noticeBox: UIView = UIView()
    private let noticeIcon: UIImageView = UIImageView(image: .icMegaphoneB24)
    private let noticeLabel: UILabel = UILabel()
    
    
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
        self.addSubviews(backButton, chatRoomNameLabel, chatParticipantsCountLabel, searchButton, alarmButton, moreButton, noticeBox, noticeIcon, noticeLabel)
    }
    
    func setLayout() {

        backButton.snp.makeConstraints {
            $0.bottom.equalTo(noticeBox.snp.top).offset(-12)
            $0.leading.equalToSuperview().inset(14)
            $0.size.equalTo(24)
        }
        
        chatRoomNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(backButton)
            $0.leading.equalTo(backButton.snp.trailing)
        }
        
        chatParticipantsCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(chatRoomNameLabel)
            $0.leading.equalTo(chatRoomNameLabel.snp.trailing)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(moreButton)
            $0.trailing.equalTo(alarmButton.snp.leading).offset(-4)
            $0.size.equalTo(36)
        }
        
        alarmButton.snp.makeConstraints {
            $0.centerY.equalTo(moreButton)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-4)
            $0.size.equalTo(36)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(5)
            $0.bottom.equalTo(noticeBox.snp.top).offset(-6)
            $0.size.equalTo(36)
        }
        
        noticeBox.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        noticeIcon.snp.makeConstraints {
            $0.top.equalTo(noticeBox).inset(5)
            $0.leading.equalTo(noticeBox).inset(17.5)
            $0.size.equalTo(30)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(noticeBox).inset(9)
            $0.leading.equalTo(noticeIcon.snp.trailing).offset(2)
            $0.trailing.equalTo(noticeBox).inset(44.5)
        }
        
    }
    
    func setStyle() {
        backgroundColor = .lkWhite
        
        backButton.do {
            $0.setImage(.icArrowLeft24, for: .normal)
        }
        
        chatRoomNameLabel.do {
            $0.setLabel(textColor: .gray900, font: fontStyle.title3_b_16.font())
        }
        
        chatParticipantsCountLabel.do {
            $0.setLabel(textColor: .gray600, font: fontStyle.body7_m_14.font())
        }
        
        searchButton.do {
            $0.setImage(.icSearch24, for: .normal)
        }
        
        alarmButton.do {
            $0.setImage(.icNoticeB2, for: .normal)
        }
        
        moreButton.do {
            $0.setImage(.icKebapmenuB24, for: .normal)
        }
        
        noticeBox.backgroundColor = .gray200
        
        noticeLabel.do {
            $0.setLabel(text: "폭언, 음란, 불법 행위, 상업적 홍보 등 채팅방 사용을 저해하는 활동에 대해 메시지 삭제 및 계정 정지 조치를 할 수 있습니다.", textColor: .gray700, font: fontStyle.label5_m_11.font())
        }
    }
    
}


