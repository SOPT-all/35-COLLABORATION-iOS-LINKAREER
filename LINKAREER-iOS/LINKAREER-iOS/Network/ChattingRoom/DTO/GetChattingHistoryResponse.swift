//
//  GetChattingHistoryResponse.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation

struct GetChattingHistoryResponse: Codable {
    let chatRoomName: String
    let chatParticiPantsCount: Int
    let chatPartner: ChatPartner
    let myChat: MyChat
    
    struct ChatPartner: Codable {
        let partnerName: String
        let isBlueChecked: Bool
        let tag: Tag
        let chatList: [Chat]
        
        struct Tag: Codable {
            let companyName: String
            let job: String
        }
    }
    
    struct MyChat: Codable {
        let chatList: [Chat]
    }
    
    struct Chat: Codable {
        let message: String
        let isReplied: Bool
        let likes: Int
        let pressedLike: Bool
        let createdDate: String 
        let reply: Reply?
        
        struct Reply: Codable {
            let replyMessage: String?
            let repliedMessageSenderName: String?
        }
    }
}

