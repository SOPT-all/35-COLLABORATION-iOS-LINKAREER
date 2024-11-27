//
//  NewbieTargetType.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import Moya

enum NewbieTargetType {
    // 서버에 요청할 API를 정의한 열거형
    case getPostList(category: String)
}

extension NewbieTargetType: BaseTargetType {
    var utilPath: String {
        // 게시물 API의 기본 경로
        return "api/v1/officiallist"
    }
    
    // 요청별 상세 경로
    var path: String {
        switch self {
        case .getPostList(let category):
            return utilPath
        }
    }
    
    // HTTP 메서드 설정
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
            // 서버로 전달할 파라미터와 인코딩 설정
        case .getPostList(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.default)
        }
    }
    // 요청 헤더 설정
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1"
        ]
    }
}
