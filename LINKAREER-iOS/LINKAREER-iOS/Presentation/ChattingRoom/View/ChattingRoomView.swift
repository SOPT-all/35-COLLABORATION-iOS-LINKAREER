//
//  ChattingRoomView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class ChattingRoomView: UIView {
    
    // MARK: - UI Properties
    
    let chatNavigationBarView: ChatNavigationBarView = ChatNavigationBarView()
    
    let chattingTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    private let chatInputBar: ChatInputBar = ChatInputBar()
    
    let certificationPopUpView: CertificationPopUpView = CertificationPopUpView()
    
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
        self.addSubviews(chattingTableView, chatNavigationBarView, chatInputBar, certificationPopUpView)
    }
    
    func setLayout() {
        chattingTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(103)
        }
        
        chatNavigationBarView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(152)
        }
        
        chatInputBar.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(103)
        }
        
        certificationPopUpView.snp.makeConstraints {
            $0.bottom.equalTo(chatInputBar.snp.top).offset(-18)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(40)
        }
    }
    
    func setStyle() {
        chattingTableView.separatorStyle = .none
        chattingTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}

