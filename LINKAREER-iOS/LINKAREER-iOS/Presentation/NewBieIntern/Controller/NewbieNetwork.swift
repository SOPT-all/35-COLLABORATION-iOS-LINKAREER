//
//  test.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import Foundation


struct Official: Codable {
    let id: Int
    let interestJob: String
    let imageUrl: String
    let title: String
    let companyName: String
    let tag: String
    let views: Int
    let comments: Int
    let dday: String
    let bookmark: Bool
}

struct OfficialListResponse: Codable {
    let officialList: [Official]
}


import Moya
enum NewbieTargetType {
    // 서버에 요청할 API를 정의한 열거형
    case getPostList(category: String)
}

extension NewbieTargetType: BaseTargetType {
    var utilPath: String {
        // 게시물 API의 기본 경로
        return "api/v1/officiallist"
    }
    
    // 요청별 상세 경로
    var path: String {
        switch self {
        case .getPostList(let category):
            return utilPath
        }
    }
    
    // HTTP 메서드 설정
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
            // 서버로 전달할 파라미터와 인코딩 설정
        case .getPostList(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.default)
        }
    }
    // 요청 헤더 설정
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1"
        ]
    }
}

protocol NewbieServiceProtocol {
    // 카테고리별 게시물 리스트 요청 메서드
    func getPostList(category: String, completion: @escaping (NetworkResult<[Official]>) -> Void)
}

//네트워크 요청을 실제로 처리하며, 싱글톤 패턴으로 구현
final class NewbieService: BaseService, NewbieServiceProtocol {
    
    // 싱글톤 인스턴스
    static let shared = NewbieService()
    
    //네트워크 요청/응답 로그를 확인하기 위해 MoyaLoggingPlugin 추가
    let provider = MoyaProvider<NewbieTargetType>(plugins: [MoyaLoggingPlugin()])
    
    // 카테고리별 게시물 리스트 요청 메서드
    // Parameters - category: 요청할 카테고리 / completion: 요청 결과를 처리하는 클로저
    func getPostList(category: String, completion: @escaping (NetworkResult<[Official]>) -> Void) {
        
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
}




import Kingfisher
import UIKit

extension UIImageView {
    
    func kfSetImage(with urlString: String?, placeholder: UIImage? = nil) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: [.transition(.none), .cacheOriginalImage,])
    }
    
}


