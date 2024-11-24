//
//  ChatInputBar.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class ChatInputBar: UIView {
    
    // MARK: - UI Properties
        
    private let chatInputTextField: UITextField = UITextField()
    private let sendButton: UIButton = UIButton()
    
    private let lineView: UIView = UIView()
    
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
        self.addSubviews(chatInputTextField, sendButton, lineView)
    }
    
    func setLayout() {
        
        lineView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        chatInputTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(44)
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalTo(chatInputTextField)
            $0.trailing.equalTo(chatInputTextField).inset(12)
            $0.size.equalTo(24)
        }
    }
    
    func setStyle() {
        self.backgroundColor = .lkWhite
        
        lineView.backgroundColor = .gray300
        
        chatInputTextField.do {
            $0.setStyle(placeholder: "메세지 입력", cornerRadius: 5, borderColor: .gray300, borderWidth: 1)
        }

        sendButton.setImage(.icMessagesend, for: .normal)
    }
    
}



