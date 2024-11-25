//
//  MyChatView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class MyChatView: UIView {
    
    // MARK: - UI Properties
    
    let messageLabel: UIButton = UIButton()
    
    private let writeTimeLabel: UILabel = UILabel()
    private let likeButton: UIButton = UIButton()
    
    
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
        addSubviews(messageLabel, writeTimeLabel, likeButton)
    }
    
    func setLayout() {
        messageLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
        
        writeTimeLabel.snp.makeConstraints {
            $0.bottom.equalTo(messageLabel)
            $0.trailing.equalTo(messageLabel.snp.leading).offset(-8)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(messageLabel)
            $0.size.equalTo(25)
        }
    }
    
    func setStyle() {
        
        messageLabel.do {
            $0.setStyle(title: "",titleColor: .gray900, font: fontStyle.body10_r_14.font(), cornerRadius: 8,
                        contentEdgeInsets: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
        }
        
        writeTimeLabel.do {
            $0.setLabel(text: "00:00",textColor: .gray600, font: fontStyle.body13_r_11.font())
        }
        
        likeButton.do {
            $0.setImage(.icChattingLike, for: .normal)
        }
        
    }
}
    
   

