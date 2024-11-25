//
//  Config.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/25/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("❌ Info.plist not found in the main bundle.")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let baseURL = infoDictionary[Keys.Plist.baseURL] as? String, !baseURL.isEmpty else {
            fatalError("❌ BASE_URL is missing or empty in Info.plist. Please check your configuration.")
        }
        return baseURL
    }()
}
