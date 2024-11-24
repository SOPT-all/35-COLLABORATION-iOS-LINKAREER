//
//  CompanyBigCardDataModel.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/22/24.
//

import UIKit

struct CompanyBigCardDataModel {
    let companyImage: UIImage
    let companyName: String
    let profileCraftPoint: String
    let aptitudeCheckPoint: String
    let interviewPassPoint: String
    let finalSealPoint: String
}
//api
struct CompanyBigCardDataModelData {
    
    static let shared = CompanyBigCardDataModelData()
    
    let cell1 = CompanyBigCardDataModel(
        companyImage: UIImage(resource: .imgCommuBestNh70),
        companyName: "LG",
        profileCraftPoint: "1",
        aptitudeCheckPoint: "3",
        interviewPassPoint: "1",
        finalSealPoint: "4"
    )
    
    let cell2 = CompanyBigCardDataModel(
        companyImage: UIImage(resource: .imgCompanypassLgcns54),
        companyName: "Samsung",
        profileCraftPoint: "1",
        aptitudeCheckPoint: "3",
        interviewPassPoint: "1",
        finalSealPoint: "4"
    )
    
    let cell3 = CompanyBigCardDataModel(
        companyImage: UIImage(resource: .imgCompanypassAmore54),
        companyName: "LG",
        profileCraftPoint: "1",
        aptitudeCheckPoint: "3",
        interviewPassPoint: "1",
        finalSealPoint: "4"
    )
    
    var allCellData: [CompanyBigCardDataModel] {
        return [cell1, cell2, cell3]
    }
}
