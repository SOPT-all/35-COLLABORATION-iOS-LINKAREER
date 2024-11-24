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
    
    let title1 = NoTagHeaderModel(nickname: "실시간",title: "UX/UI 인기 공고 모아보기")
    let title2 = NoTagHeaderModel(nickname: "UX/UI",title: "직무 기업별 합격 가이드")

}
