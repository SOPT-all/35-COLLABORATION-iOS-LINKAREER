//
//  JobSuccessCardModel.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit

struct SectionTitleModel {
    let title: String
    let items1: [JobSuccessCardModel]
    let items2: [JobSuccessCardModel]
    let items3: [JobSuccessCardModel]
}

struct JobSuccessCardModel {
    let iconImage: UIImage
    let head: String
    let boldText: String
}

struct JobSuccessDummyData {
    static let shared = JobSuccessDummyData()
    
    let section1 = SectionTitleModel(
        title: "합격후기",
        items1: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DPersonalitypass),
                head: "합격을 위한 꿀팁과 전략",
                boldText: "인/적성 합격후기"
            )
        ],
        items2: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DFinalpass),
                head: "면접장에서 빛난 전략",
                boldText: "면접 합격후기"
            )
        ],
        items3: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DInterviewpass),
                head: "최종합격까지의 여정",
                boldText: "최종 합격후기"
            )
        ]
    )
    
    let section2 = SectionTitleModel(
        title: "질문방",
        items1: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DLiberalartsmentor),
                head: "문과 맞춤형 취업 멘토링",
                boldText: "문과 멘토 질문방"
            )
        ],
        items2: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DSciencementor),
                head: "이과 맞춤형 취업 멘토링",
                boldText: "이과 멘토 질문방"
            )
        ],
        items3: [
            JobSuccessCardModel(
                iconImage: UIImage(resource: .img3DQna),
                head: "가장 궁금해 한 Q&A",
                boldText: "BEST Q&A"
            )
        ]
    )
    
    
    var allSections: [SectionTitleModel] {
        return [section1, section2]
    }
}
