//
//  HomeTargetType.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation
import Moya

enum HomeTargetType {
    case getPostList(category: String)
}

extension HomeTargetType: BaseTargetType {
    var utilPath: String {
        return "api/v1/posts"
    }
    
    var path: String {
        switch self {
        case .getPostList(let category):
            return utilPath
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getPostList(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1"
        ]
    }
}
