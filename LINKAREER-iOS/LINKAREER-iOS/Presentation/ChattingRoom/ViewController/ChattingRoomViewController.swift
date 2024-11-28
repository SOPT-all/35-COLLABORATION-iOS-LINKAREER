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
    
    // MARK: - Properties
    
    private var chatData: [ChatRoom] = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
        setActions()
        getChatHistory()
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
        chattingRoomView.chattingTableView.register(OtherChatCell.self, forCellReuseIdentifier: OtherChatCell.identifier)
        chattingRoomView.chattingTableView.register(MyChatCell.self, forCellReuseIdentifier: MyChatCell.identifier)
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
    
    func getChat(for indexPath: IndexPath, in chatRoom: ChatRoom) -> Chat {
        let sortedChats = getSortedChats(for: indexPath.section)
        return sortedChats[indexPath.row]
    }
    
    func getSortedChats(for section: Int) -> [Chat] {
        let chatRoom = chatData[section]
        let combinedChats = chatRoom.myChat.chatList + chatRoom.chatPartner.chatList
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return combinedChats.sorted { chat1, chat2 in
            guard
                let date1 = dateFormatter.date(from: chat1.createdTime),
                let date2 = dateFormatter.date(from: chat2.createdTime)
            else {
                return false
            }
            return date1 < date2
        }
    }
    
    //네트워크 통신
    func getChatHistory() {
        NetworkService.shared.chattingRoomService.getChatHistory { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                let chatRoom = ChatRoom(
                    chatRoomName: data.chatRoomName,
                    chatParticipantsCount: data.chatParticiPantsCount,
                    chatPartner: ChatPartner(
                        partnerName: data.chatPartner.partnerName,
                        isBlueChecked: data.chatPartner.isBlueChecked,
                        tag: Tag(
                            companyName: data.chatPartner.tag.companyName,
                            job: data.chatPartner.tag.job
                        ),
                        chatList: data.chatPartner.chatList.map { chat in
                            Chat(
                                message: chat.message,
                                isReplied: chat.isReplied,
                                likes: chat.likes,
                                pressedLike: chat.pressedLike,
                                createdTime: chat.createdTime,
                                reply: chat.reply.map { reply in
                                    Reply(
                                        replyMessage: reply.replyMessage,
                                        repliedMessageSenderName: reply.repliedMessageSenderName
                                    )
                                },
                                isMine: false
                            )
                        }
                    ),
                    myChat: MyChat(
                        chatList: data.myChat.chatList.map { chat in
                            Chat(
                                message: chat.message,
                                isReplied: chat.isReplied,
                                likes: chat.likes,
                                pressedLike: chat.pressedLike,
                                createdTime: chat.createdTime,
                                reply: chat.reply.map { reply in
                                    Reply(
                                        replyMessage: reply.replyMessage,
                                        repliedMessageSenderName: reply.repliedMessageSenderName
                                    )
                                },
                                isMine: true
                            )
                        }
                    )
                )
                
                self.chatData = [chatRoom]
                
                DispatchQueue.main.async {
                    self.chattingRoomView.chattingTableView.reloadData()
                }
            default:
                print("Failed to fetch post list")
                return
            }
        }
    }
}


extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < chatData.count else { return 0 }
        return getSortedChats(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section < chatData.count else { return UITableViewCell() }
        
        let chatRoom = chatData[indexPath.section]
        let chat = getChat(for: indexPath, in: chatRoom)
        
        chattingRoomView.chatNavigationBarView.chatRoomNameLabel.text = chatRoom.chatRoomName
        chattingRoomView.chatNavigationBarView.chatParticipantsCountLabel.text = "\(chatRoom.chatParticipantsCount)명"
        
        if chat.isMine {
            guard let chatCell = tableView.dequeueReusableCell(withIdentifier: MyChatCell.identifier, for: indexPath) as? MyChatCell else {
                return UITableViewCell()
            }
            chatCell.isChatReply(chat: chat)
            chatCell.configureChat(chat: chat)
            chatCell.selectionStyle = .none
            return chatCell
        } else {
            guard let chatCell = tableView.dequeueReusableCell(withIdentifier: OtherChatCell.identifier, for: indexPath) as? OtherChatCell else {
                return UITableViewCell()
            }
            chatCell.isChatReply(chat: chat)
            chatCell.configureChat(partner: chatRoom.chatPartner, chat: chat)
            chatCell.selectionStyle = .none
            return chatCell
        }
    }
    
}
