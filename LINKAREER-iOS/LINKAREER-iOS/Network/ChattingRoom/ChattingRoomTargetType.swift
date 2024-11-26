//
//  ChattingRoomTargetType.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation

import Moya

enum ChattingRoomTargetType {
    case getChatHistory
}

extension ChattingRoomTargetType: BaseTargetType {
    var utilPath: String {
        return "/api/v1/chatting/"
    }
    
    var path: String {
        switch self {
        case .getChatHistory:
            return utilPath + "history"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1"
        ]
    }
}

