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
    case postBookMark(officialId: Int)
    case deleteBookMark(officialId: Int)
}

extension NewbieTargetType: BaseTargetType {
    var utilPath: String {
        switch self {
        case .getPostList(let category):
            return "api/v1/officiallist"
        case .postBookMark(let officialId):
            return "api/v1/bookmark"
        case .deleteBookMark(let officialId):
            return "api/v1/bookmark"
        }
    }
    
    // 요청별 상세 경로
    var path: String {
        switch self {
        case .getPostList(let category):
            return utilPath
        case .postBookMark(let officialId):
            return "\(utilPath)/\(officialId)"
        case .deleteBookMark(let officialId):
            return "\(utilPath)/\(officialId)"
        }
    }
    
    // HTTP 메서드 설정
    var method: Moya.Method {
        switch self {
        case .getPostList(let category):
            return .get
        case .postBookMark(let officialId):
            return .post
        case .deleteBookMark(let officialId):
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
            // 서버로 전달할 파라미터와 인코딩 설정
        case .getPostList(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.default)
        case .postBookMark:
            return .requestPlain
        case .deleteBookMark:
            return .requestPlain
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
