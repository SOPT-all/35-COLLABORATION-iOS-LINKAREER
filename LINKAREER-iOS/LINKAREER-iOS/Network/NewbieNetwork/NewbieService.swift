//
//  NewbieNetwork.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import Moya
import Foundation

protocol NewbieServiceProtocol {
    // 카테고리별 게시물 리스트 요청 메서드
    func getPostList(category: String, completion: @escaping (NetworkResult<[GetOfficialResponse]>) -> Void)
    func postBookMark(officialId: Int, completion: @escaping (NetworkResult<[BookmarkResponseDTO]>) -> Void)
    func deleteBookMark(officialId: Int, completion: @escaping (NetworkResult<[BookmarkResponseDTO]>) -> Void)
}

//네트워크 요청을 실제로 처리하며, 싱글톤 패턴으로 구현
final class NewbieService: BaseService, NewbieServiceProtocol {
    
    // 싱글톤 인스턴스
    static let shared = NewbieService()
    
    //네트워크 요청/응답 로그를 확인하기 위해 MoyaLoggingPlugin 추가
    let provider = MoyaProvider<NewbieTargetType>(plugins: [MoyaLoggingPlugin()])
    
    // 카테고리별 게시물 리스트 요청 메서드
    // Parameters - category: 요청할 카테고리 / completion: 요청 결과를 처리하는 클로저
    func getPostList(category: String, completion: @escaping (NetworkResult<[GetOfficialResponse]>) -> Void) {
        
        // MoyaProvider를 사용하여 API 호출
        provider.request(.getPostList(category: category)) { response in
            switch response {
                // 성공적으로 응답을 받은 경우
            case .success(let result):
                let statusCode = result.statusCode // 응답 상태 코드
                let data = result.data // 응답 데이터
                
                do {
                    // 응답 데이터를 OfficialListResponse로 디코딩
                    let decodedData = try JSONDecoder().decode(OfficialListResponse.self, from: data)
                    completion(.success(decodedData.officialList)) // 배열 반환
                } catch {
                    print("❌ 디코딩 실패: \(error.localizedDescription)")
                    completion(.decodedErr)
                }
                // 네트워크 요청 실패 시
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func postBookMark(officialId: Int, completion: @escaping (NetworkResult<[BookmarkResponseDTO]>) -> Void) {
        provider.request(.postBookMark(officialId: officialId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult: NetworkResult<[BookmarkResponseDTO]> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    func deleteBookMark(officialId: Int, completion: @escaping (NetworkResult<[BookmarkResponseDTO]>) -> Void) {
        provider.request(.deleteBookMark(officialId: officialId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult: NetworkResult<[BookmarkResponseDTO]> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

