//
//  SceneDelegate.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/17/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = NewbieInternViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
