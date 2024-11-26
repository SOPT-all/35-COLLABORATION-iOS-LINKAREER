//
//  CustomDataModel.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit

struct CompanyDayCardModel {
    let day: String
    let image: UIImage
    let buttonTitle: String
    let companyName: String
    let title: String
    let category: String
    let viewCount: Int
    let commentCount: Int
}
//api
struct CompanyDayCardModelData {
    
    static let shared = CompanyDayCardModelData()
    
    let cards: [CompanyDayCardModel] = [
        CompanyDayCardModel(
            day: "7",
            image: UIImage(resource: .imgHotofficialLgcns142),
            buttonTitle: "정규직 1차 면접 프리패스",
            companyName: "LG CNS",
            title: "[LG CNS] [인턴, 학사] 2025년 동계 DX Core...",
            category: "정규직 1차 면접 프리패스",
            viewCount: 20481,
            commentCount: 342
        ),
        CompanyDayCardModel(
            day: "10",
            image: UIImage(resource: .imgHotofficialIbk142),
            buttonTitle: "정규직 1차 면접 프리패스",
            companyName: "IBK기업은행",
            title: "[IBK기업은행] 2025년 동계 체험형 청년인턴 채용...",
            category: "정규직 1차 면접 프리패스",
            viewCount: 31123,
            commentCount: 545
        ),
        CompanyDayCardModel(
            day: "0",
            image: UIImage(resource: .imgHotofficialLalasweet142),
            buttonTitle: "정규직 전환",
            companyName: "주식회사 라라스윗",
            title: "[라라스윗] 온라인 마케팅 인턴십 5기",
            category: "정규직 전환",
            viewCount: 3424,
            commentCount: 76
        ),
        CompanyDayCardModel(
            day: "7",
            image: UIImage(resource: .imgHotofficialLgcns142),
            buttonTitle: "정규직 1차 면접 프리패스",
            companyName: "LG CNS",
            title: "[LG CNS] [인턴, 학사] 2025년 동계 DX Core...",
            category: "정규직 1차 면접 프리패스",
            viewCount: 20481,
            commentCount: 342
        ),
        CompanyDayCardModel(
            day: "99",
            image: UIImage(resource: .imgHotofficialIbk142),
            buttonTitle: "정규직 1차 면접 프리패스",
            companyName: "IBK기업은행",
            title: "[IBK기업은행] 2025년 동계 체험형 청년인턴 채용...",
            category: "정규직 1차 면접 프리패스",
            viewCount: 31123,
            commentCount: 545
        )
    ]
    
    var allCard: [CompanyDayCardModel] {
        return cards
    }
}
