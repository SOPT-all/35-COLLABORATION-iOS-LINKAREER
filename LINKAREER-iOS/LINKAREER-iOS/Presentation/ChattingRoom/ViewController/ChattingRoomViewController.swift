//
//  ChattingRoomViewController.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class ChattingRoomViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let chattingRoomView: ChattingRoomView = ChattingRoomView()
    
    private let chatPartner = ChatPartner.dummyData
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
        setActions()
    }
    
    func setHierarchy() {
        self.view.addSubview(chattingRoomView)
    }
    
    func setLayout() {
        chattingRoomView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .lkWhite
        chattingRoomView.chattingTableView.showsVerticalScrollIndicator = false
    }
    
    func setDelegate() {
        chattingRoomView.chattingTableView.delegate = self
        chattingRoomView.chattingTableView.dataSource = self
        
        chattingRoomView.chattingTableView.estimatedRowHeight = 160
        chattingRoomView.chattingTableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerCell() {
        chattingRoomView.chattingTableView.register(ReplyChatCell.self, forCellReuseIdentifier: ReplyChatCell.identifier)
        chattingRoomView.chattingTableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.identifier)
    }
    
    func setActions() {
        chattingRoomView.certificationPopUpView.closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        chattingRoomView.certificationPopUpView.certificationButton.addTarget(self, action: #selector(certificationButtonDidTap), for: .touchUpInside)
        chattingRoomView.chatNavigationBarView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
}

private extension ChattingRoomViewController {
    
    @objc
    func backButtonDidTap() {
        // TODO: - 화면 전환 연결 시 popViewController
    }
    
    @objc
    func certificationButtonDidTap() {
        // TODO: - ChatCertificationVC 화면 전환 연결
    }
    
    @objc
    func closeButtonDidTap() {
        chattingRoomView.certificationPopUpView.removeFromSuperview()
    }
    
    func getTotalChatCount(for section: Int) -> Int {
        let chatRoom = chatPartner[section]
        let myChatCount = chatRoom.myChat.chatList.count
        let partnerChatCount = chatRoom.chatPartner.chatList.count
        
        return myChatCount + partnerChatCount
    }
    
    func getChat(for indexPath: IndexPath, in chatRoom: ChatRoom) -> Chat {
        let myChatList = chatRoom.myChat.chatList
        let partnerChatList = chatRoom.chatPartner.chatList
        
        if indexPath.row < myChatList.count {
            return myChatList[indexPath.row]
        } else {
            let partnerIndex = indexPath.row - myChatList.count
            return partnerChatList[partnerIndex]
        }
    }
    
    func isChatMine(for indexPath: IndexPath, in chatRoom: ChatRoom) -> Bool {
        let myChatList = chatRoom.myChat.chatList
        let partnerChatList = chatRoom.chatPartner.chatList
        
        // 내 채팅인지 확인
        if indexPath.row < myChatList.count {
            return true
        } else {
            let partnerIndex = indexPath.row - myChatList.count
            let chat = partnerChatList[partnerIndex]
            return chat.reply?.repliedMessageSenderName == nil // 답장 아닌 경우 내 채팅
        }
    }
    
}


extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalChatCount = getTotalChatCount(for: section)
        return totalChatCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatRoom = chatPartner[indexPath.section]
        let chatPartner = chatRoom.chatPartner

        chattingRoomView.chatNavigationBarView.chatRoomNameLabel.text = chatRoom.chatRoomName
        chattingRoomView.chatNavigationBarView.chatParticipantsCountLabel.text = "\(chatRoom.chatParticipantsCount)명"

        let chat = getChat(for: indexPath, in: chatRoom)
        let isMyChat = isChatMine(for: indexPath, in: chatRoom)

        if isMyChat {
            if chat.isReplied {
                // 내 채팅이면서 답장이 있는 경우
                guard let replyChatCell = tableView.dequeueReusableCell(withIdentifier: ReplyChatCell.identifier, for: indexPath) as? ReplyChatCell else {
                    return UITableViewCell()
                }
                replyChatCell.setChatVisible(isChatMine: true)
                replyChatCell.configureMyChat(chat: chat)
                replyChatCell.selectionStyle = .none
                
                return replyChatCell
            } else {
                // 내 채팅이고 답장이 없는 경우
                guard let chatCell = tableView.dequeueReusableCell(withIdentifier: ChatCell.identifier, for: indexPath) as? ChatCell else {
                    return UITableViewCell()
                }
                chatCell.setChatVisible(isChatMine: true)
                chatCell.configureMyChat(chat: chat)
                chatCell.selectionStyle = .none

                return chatCell
            }
        } else {
            if chat.isReplied {
                // 상대 채팅이면서 답장이 있는 경우
                guard let replyChatCell = tableView.dequeueReusableCell(withIdentifier: ReplyChatCell.identifier, for: indexPath) as? ReplyChatCell else {
                    return UITableViewCell()
                }
                replyChatCell.setChatVisible(isChatMine: false)
                replyChatCell.configureOtherChat(partner: chatPartner, chat: chat)
                replyChatCell.selectionStyle = .none

                return replyChatCell
            } else {
                // 상대 채팅이고 답장이 없는 경우
                guard let chatCell = tableView.dequeueReusableCell(withIdentifier: ChatCell.identifier, for: indexPath) as? ChatCell else {
                    return UITableViewCell()
                }
                chatCell.setChatVisible(isChatMine: false)
                chatCell.configureOtherChat(partner: chatPartner, chat: chat)
                chatCell.selectionStyle = .none
                
                return chatCell
            }
        }
    }
    
}
