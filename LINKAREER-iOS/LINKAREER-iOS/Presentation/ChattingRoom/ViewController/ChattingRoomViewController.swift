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
    
    func getTotalChatCount(for section: Int) -> Int {
        
        let chatRoom = chatData[section]
        let myChatCount = chatRoom.myChat.chatList.count
        let partnerChatCount = chatRoom.chatPartner.chatList.count
        
        return myChatCount + partnerChatCount
    }
    
    func getChat(for indexPath: IndexPath, in chatRoom: ChatRoom) -> Chat {
        let myChatList = chatRoom.myChat.chatList
        let partnerChatList = chatRoom.chatPartner.chatList
        
        // 상대방 채팅 먼저 가져오기
        if indexPath.row < partnerChatList.count {
            return partnerChatList[indexPath.row]
        } else {
            let myIndex = indexPath.row - partnerChatList.count
            return myChatList[myIndex]
        }
    }
    
    func isChatMine(for indexPath: IndexPath, in chatRoom: ChatRoom) -> Bool {
        let myChatList = chatRoom.myChat.chatList
        let partnerChatList = chatRoom.chatPartner.chatList
        
        // 내 채팅인지 확인
        if indexPath.row < myChatList.count {
            return true // 내 채팅
        } else {
            return false // 상대방 채팅
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
                                }
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
                                }
                            )
                        }
                    )
                )
                
                self.chatData = [chatRoom]
                
                DispatchQueue.main.async {
                    self.chattingRoomView.chattingTableView.reloadData()
                }
            case .requestErr:
                print("요청 오류입니다")
            case .decodedErr:
                print("디코딩 오류입니다")
            case .pathErr:
                print("경로 오류입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
}


extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // chatData의 섹션 수 반환
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < chatData.count else { return 0 } // 방어 코드
        return getTotalChatCount(for: section) // 섹션 내 전체 채팅 수 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section < chatData.count else { return UITableViewCell() } // 방어 코드
        
        // 섹션의 채팅 데이터를 가져옴
        let chatRoom = chatData[indexPath.section]
        let chatPartner = chatRoom.chatPartner
        
        // 인덱스에 맞는 채팅 가져오기
        let chat = getChat(for: indexPath, in: chatRoom)
        let isMyChat = isChatMine(for: indexPath, in: chatRoom)

        if isMyChat {
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
            chatCell.configureChat(partner: chatPartner, chat: chat)
            chatCell.selectionStyle = .none
            return chatCell
        }
    }

}
