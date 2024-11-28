//
//  HomeService.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation

import Moya


protocol HomeServiceProtocol {
    func getPostList(category: String, completion: @escaping (NetworkResult<GetPostListResponse>) -> Void)
}

final class HomeService: BaseService, HomeServiceProtocol {
    
    static let shared = HomeService()
    let provider = MoyaProvider<HomeTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getPostList(category: String, completion: @escaping (NetworkResult<GetPostListResponse>) -> Void) {
        provider.request(.getPostList(category: category)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<GetPostListResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}


