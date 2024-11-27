//
//  NetworkService.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    let chattingRoomService: ChattingRoomService = ChattingRoomService()
   
}

