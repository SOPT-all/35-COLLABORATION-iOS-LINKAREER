//
//  ChatCertificationCompleteViewController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class ChatCertificationCompleteViewController: UIViewController {
    
    private let rootView = ChatCertificationCompleteView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

extension ChatCertificationCompleteViewController {
    
    func setHierarchy() {
        view.addSubview(rootView)
    }
    
    func setLayout() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
