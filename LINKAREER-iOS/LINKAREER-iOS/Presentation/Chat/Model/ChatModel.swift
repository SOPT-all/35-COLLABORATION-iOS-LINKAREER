//
//  ChatModel.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

struct ChatModel {
    let ChatCategoryList: [ChatCategoryList]
}

struct ChatCategoryList {
    let category: String
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
