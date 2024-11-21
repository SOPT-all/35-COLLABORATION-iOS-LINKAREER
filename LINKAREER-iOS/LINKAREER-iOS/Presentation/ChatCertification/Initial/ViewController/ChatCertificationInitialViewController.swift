//
//  ChatCertificationInitialViewController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/19/24.
//
import UIKit

import SnapKit
import Then

final class ChatCertificationInitialViewController: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = ChatCertificationInitialView()
    var dummy = CertificationInitialList.dummy()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setHierarchy()
        setLayout()
        
        setDelegate()
        setRegister()
        setAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension ChatCertificationInitialViewController {
    func setHierarchy() {
        view.addSubview(rootView)
    }
    
    func setLayout() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        rootView.listCollectionView.delegate = self
        rootView.listCollectionView.dataSource = self
    }
    
    func setRegister() {
        rootView.listCollectionView.register(ChatCertificationInitialCell.self,
                                             forCellWithReuseIdentifier: ChatCertificationInitialCell.identifier)
    }
    
    func setAddTarget() {
        rootView.confirmButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    @objc func buttonDidTapped() {
        let nextViewController = ChatCertificationProcedureViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ChatCertificationInitialViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCertificationInitialCell", for: indexPath) as? ChatCertificationInitialCell else { return UICollectionViewCell() }
        let item = dummy[indexPath.item]
        cell.configure(with: item)
        return cell
    }
}

extension ChatCertificationInitialViewController: UICollectionViewDelegate {}
