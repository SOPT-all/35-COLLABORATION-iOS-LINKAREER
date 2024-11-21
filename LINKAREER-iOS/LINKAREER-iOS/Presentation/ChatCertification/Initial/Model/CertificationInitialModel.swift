//
//  CertificationInitialModel.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/20/24.
//

import UIKit

struct CertificationInitialModel {
    let CertificationInitialList: [CertificationInitialList]
}

struct CertificationInitialList {
    let mainText: String
    let subText: String
    let iconImage: UIImage?
}

extension CertificationInitialList {
    static func dummy() -> [CertificationInitialList] {
        return [
            CertificationInitialList(mainText: "이름", subText: "실명 인증을 통해 본인인지 확인해요", iconImage: UIImage(resource: .icChecklistPerson)),
            CertificationInitialList(mainText: "휴대폰 번호", subText: "확실한 실명 인증을 위해 확인해요", iconImage: UIImage(resource: .icChecklistPhone)),
            CertificationInitialList(mainText: "합불 화면 캡쳐본", subText: "대화의 신뢰도를 높이기 위해 확인해요", iconImage: UIImage(resource: .icChecklistDocu))
        ]
    }
}
