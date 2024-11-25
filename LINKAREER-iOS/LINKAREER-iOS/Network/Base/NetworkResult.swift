//
//  NetworkResult.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)               // 서버 통신 성공
    case requestErr               // 요청 에러 발생
    case decodedErr               // 디코딩 오류 발생
    case pathErr                  // 경로 에러 발생
    case serverErr                // 서버의 내부적 에러가 발생
    case networkFail              // 네트워크 연결 실패
}

