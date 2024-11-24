//
//  NoTagHeader.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/24/24.
//

import UIKit

struct NoTagHeaderModel {
    
    let nickname: String
    let title: String
    
}
//api
struct NoTagHeaderModelData {
    
    static let shared = NoTagHeaderModelData()
    
    let title1 = NoTagHeaderModel(nickname: "앤솝",title: "님이 관심 있을만한 공고")
    let title2 = NoTagHeaderModel(nickname: "앤솝",title: "님과 같은 관심사를 가진 사람들")
    let title3 = NoTagHeaderModel(nickname: "앤솝",title: "님에게 추천하는 공고")
}
