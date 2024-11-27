//
//  CustomDataModel.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit

struct CompanyDayCardModel {
    let dDay: String
    let imageUrl: String
    let interestJob: String
    let companyName: String
    let title: String
    let tag: String
    let views: Int
    let comments: Int
    let bookmark : Bool
}

struct CompanyDayCardModelData {
    
    static let shared = CompanyDayCardModelData()
    
    let cards: [CompanyDayCardModel] = [
        CompanyDayCardModel(
            dDay: "7",
            imageUrl: "img_hotofficial_lgcns_142",
            interestJob: "정규직 1차 면접 프리패스",
            companyName: "LG CNS",
            title: "[LG CNS] [인턴, 학사] 2025년 동계 DX Core...",
            tag: "정규직 1차 면접 프리패스",
            views: 20481,
            comments: 342,
            bookmark: true
        ),
        CompanyDayCardModel(
            dDay: "10",
            imageUrl: "imgHotofficialIbk142",
            interestJob: "정규직 1차 면접 프리패스",
            companyName: "IBK기업은행",
            title: "[IBK기업은행] 2025년 동계 체험형 청년인턴 채용...",
            tag: "정규직 1차 면접 프리패스",
            views: 31123,
            comments: 545,
            bookmark: true
        ),
        CompanyDayCardModel(
            dDay: "0",
            imageUrl: "imgHotofficialLalasweet142",
            interestJob: "정규직 전환",
            companyName: "주식회사 라라스윗",
            title: "[라라스윗] 온라인 마케팅 인턴십 5기",
            tag: "정규직 전환",
            views: 3424,
            comments: 76,
            bookmark: true
        ),
        CompanyDayCardModel(
            dDay: "7",
            imageUrl: "imgHotofficialIbk142",
            interestJob: "정규직 1차 면접 프리패스",
            companyName: "LG CNS",
            title: "[LG CNS] [인턴, 학사] 2025년 동계 DX Core...",
            tag: "정규직 1차 면접 프리패스",
            views: 20481,
            comments: 342,
            bookmark: true
        ),
        CompanyDayCardModel(
            dDay: "99",
            imageUrl: "imgHotofficialIbk142",
            interestJob: "정규직 1차 면접 프리패스",
            companyName: "IBK기업은행",
            title: "[IBK기업은행] 2025년 동계 체험형 청년인턴 채용...",
            tag: "정규직 1차 면접 프리패스",
            views: 31123,
            comments: 545,
            bookmark: true
        )
    ]
    
    var allCard: [CompanyDayCardModel] {
        return cards
    }
}
