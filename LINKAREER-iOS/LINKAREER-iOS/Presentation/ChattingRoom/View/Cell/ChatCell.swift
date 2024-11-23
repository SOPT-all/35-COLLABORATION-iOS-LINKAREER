//
//  OtherChatCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
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

