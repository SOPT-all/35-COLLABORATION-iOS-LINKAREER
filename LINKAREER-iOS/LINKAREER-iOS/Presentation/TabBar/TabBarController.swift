//
//  TabBarController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/18/24.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    var customTabBar = CustomTabBar()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(customTabBar, forKey: "tabBar")
        
        setupStyle()
        addTabBarController()
        self.selectedIndex = TabBarItem.allCases.firstIndex(of: .home) ?? 0
    }

}

private extension TabBarController {
    func setupStyle() {
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .gray // TODO: - Color
        tabBar.tintColor = .black
    }
    
    func addTabBarController() {
        let viewControllers = TabBarItem.allCases.map {
            let currentViewController = createViewController(
                title: $0.itemTitle ?? "",
                image: $0.normalItem ?? UIImage(),
                selectedImage: $0.selectedItem ?? UIImage(),
                viewController: $0.targetViewController
            )
            return currentViewController
        }

        setViewControllers(viewControllers, animated: false)
    }
    
    func createViewController(title: String,
                              image: UIImage,
                              selectedImage: UIImage,
                              viewController: UIViewController) -> UIViewController {
        let currentViewController = viewController
        let tabbarItem = UITabBarItem(
            title: title,
            image: image.withRenderingMode(.alwaysOriginal),
            selectedImage: selectedImage.withRenderingMode(.alwaysOriginal)
        )
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11) as Any, // TODO: - Font
            .foregroundColor: UIColor.gray // TODO: - Color
        ]
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11) as Any, // TODO: - Font
            .foregroundColor: UIColor.black // TODO: - Color
        ]
        
        tabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        tabbarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        tabbarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        currentViewController.tabBarItem = tabbarItem
        
        return currentViewController
    }
}

// Custom Tab Bar
final class CustomTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height += 14
        return size
    }
}
