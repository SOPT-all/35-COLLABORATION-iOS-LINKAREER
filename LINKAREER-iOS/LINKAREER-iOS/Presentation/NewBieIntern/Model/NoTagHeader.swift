//
//  NoTagHeader.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/24/24.
//

import UIKit

struct NoTagHeader {
    
    let nickname: String
    let title: String
    
    static var noTagHeaderData: [NoTagHeader] {
        return [
            NoTagHeader(nickname: "앤솝",title: "님이 관심 있을만한 공고"),
            NoTagHeader(nickname: "앤솝",title: "님과 같은 관심사를 가진 사람들"),
            NoTagHeader(nickname: "앤솝",title: "님에게 추천하는 공고"),
        ]
    }
}
