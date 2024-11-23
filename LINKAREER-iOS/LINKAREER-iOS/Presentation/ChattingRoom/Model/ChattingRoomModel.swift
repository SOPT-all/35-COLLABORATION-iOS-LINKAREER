//
//  ChattingRoomModel.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/23/24.
//

import Foundation

// MARK: - 모델 구조체

struct ChatRoom {
    let chatRoomName: String
    let chatParticipantsCount: Int
    let chatPartner: ChatPartner
    let myChat: MyChat
}

struct ChatPartner {
    let partnerName: String
    let isBlueChecked: Bool
    let tag: Tag
    let chatList: [Chat]
    
    static var dummyData: [ChatRoom] {
           return [
               ChatRoom(
                   chatRoomName: "현대자동차",
                   chatParticipantsCount: 13243,
                   chatPartner: ChatPartner(
                       partnerName: "무심한 맥",
                       isBlueChecked: true,
                       tag: Tag(companyName: "현대자동차", job: "생산관리"),
                       chatList: [
                           Chat(
                               message: "안녕하세요",
                               isReplied: true,
                               likes: 10,
                               pressedLike: true,
                               createdDate: "2024-11-23",
                               reply: Reply(replyMessage: "반갑습니다!", repliedMessageSenderName: "민서공이")
                           ),
                           Chat(
                               message: "이 프로젝트 어떻게 진행할까요?",
                               isReplied: false,
                               likes: 5,
                               pressedLike: false,
                               createdDate: "2024-11-23",
                               reply: nil
                           )
                       ]
                   ),
                   myChat: MyChat(
                       chatList: [
                           Chat(
                               message: "제가 담당하겠습니다!",
                               isReplied: false,
                               likes: 30,
                               pressedLike: true,
                               createdDate: "2024-11-22",
                               reply: nil
                           ),
                           Chat(
                               message: "알겠습니다.",
                               isReplied: true,
                               likes: 12,
                               pressedLike: false,
                               createdDate: "2024-11-21",
                               reply: Reply(replyMessage: "확인했습니다.", repliedMessageSenderName: "무심한 맥")
                           )
                       ]
                   )
               ),
               ChatRoom(
                   chatRoomName: "LG전자",
                   chatParticipantsCount: 5213,
                   chatPartner: ChatPartner(
                       partnerName: "무관심한 곰",
                       isBlueChecked: false,
                       tag: Tag(companyName: "LG전자", job: "연구개발"),
                       chatList: [
                           Chat(
                               message: "어디서 점심 먹을까요?",
                               isReplied: false,
                               likes: 20,
                               pressedLike: true,
                               createdDate: "2024-11-22",
                               reply: nil
                           ),
                           Chat(
                               message: "이번 주말에 영화 보러 갈래요?",
                               isReplied: true,
                               likes: 15,
                               pressedLike: false,
                               createdDate: "2024-11-21",
                               reply: Reply(replyMessage: "좋아요!", repliedMessageSenderName: "무관심한 토끼")
                           )
                       ]
                   ),
                   myChat: MyChat(
                       chatList: [
                           Chat(
                               message: "이번 주말은 조금 바쁠 것 같아요.",
                               isReplied: true,
                               likes: 8,
                               pressedLike: false,
                               createdDate: "2024-11-20",
                               reply: Reply(replyMessage: "알겠습니다!", repliedMessageSenderName: "무관심한 곰")
                           ),
                           Chat(
                               message: "다음 주는 어떨까요?",
                               isReplied: false,
                               likes: 4,
                               pressedLike: false,
                               createdDate: "2024-11-19",
                               reply: nil
                           )
                       ]
                   )
               )
           ]
    }
}

struct Tag {
    let companyName: String
    let job: String
}

struct Chat {
    let message: String
    let isReplied: Bool
    let likes: Int
    let pressedLike: Bool
    let createdDate: String
    let reply: Reply?
}

struct Reply {
    let replyMessage: String?
    let repliedMessageSenderName: String?
}

struct MyChat {
    let chatList: [Chat]
}

