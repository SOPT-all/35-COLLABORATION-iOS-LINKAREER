//
//  ChattingRoomService.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation

import Moya


protocol ChattingRoomServiceProtocol {
    func getChatHistory(completion: @escaping (NetworkResult<GetChattingHistoryResponse>) -> Void)
}

final class ChattingRoomService: BaseService, ChattingRoomServiceProtocol {
    
    static let shared = ChattingRoomService()
    let provider = MoyaProvider<ChattingRoomTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getChatHistory(completion: @escaping (NetworkResult<GetChattingHistoryResponse>) -> Void) {
        provider.request(.getChatHistory) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<GetChattingHistoryResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

