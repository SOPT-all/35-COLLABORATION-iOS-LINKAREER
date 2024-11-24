//
//  ChatModel.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

struct ChatModel {
    let ChatCategoryList: [ChatCategoryList]
    let ChatList: [ChatList]
}

struct ChatCategoryList {
    let category: String
}

struct ChatList {
    let thumbnailImage: UIImage
    let firstTagLabel: String
    let secondTagLabel: String
    let thirdTagLabel: String
    let companyLabel: String
    let chatTitleLabel: String
    let chatParticipantLabel: String
}

extension ChatCategoryList {
    static func categoryDummy() -> [ChatCategoryList] {
        return [
            ChatCategoryList(category: "전체"),
            ChatCategoryList(category: "채용"),
            ChatCategoryList(category: "대외활동/공모전"),
            ChatCategoryList(category: "교육"),
            ChatCategoryList(category: "직무"),
            ChatCategoryList(category: "주제별")
        ]
    }
}

extension ChatList {
    static func listDummy() -> [ChatList] {
        return [
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonLgcns74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "LG 이야기방",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "LG CNS",
                     chatTitleLabel: "[LG CNS] 2025년 동계 체험형 인턴 채...",
                     chatParticipantLabel: "참여인원 12947"),
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonSamsung74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "삼성 이야기방",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "삼성전자",
                     chatTitleLabel: "[삼성전자] 2025년 상반기 체험형 인턴...",
                     chatParticipantLabel: "참여인원 9634"),
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonAmore74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "AMORE PACIFIC",
                     chatTitleLabel: "[아모레퍼시픽] 2025년 동계 체험형 인...",
                     chatParticipantLabel: "참여인원 12947"),
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonLgcns74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "LG 이야기방",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "LG CNS",
                     chatTitleLabel: "[LG CNS] 2025년 동계 체험형 인턴 채...",
                     chatParticipantLabel: "참여인원 12947"),
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonSamsung74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "삼성 이야기방",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "삼성전자",
                     chatTitleLabel: "[삼성전자] 2025년 상반기 체험형 인턴...",
                     chatParticipantLabel: "참여인원 9634"),
            ChatList(thumbnailImage: .imgJoinChattingroomInpersonAmore74,
                     firstTagLabel: "인턴 talk",
                     secondTagLabel: "",
                     thirdTagLabel: "현직 멘토 질문방",
                     companyLabel: "AMORE PACIFIC",
                     chatTitleLabel: "[아모레퍼시픽] 2025년 동계 체험형 인...",
                     chatParticipantLabel: "참여인원 12947")
        ]
    }
}
