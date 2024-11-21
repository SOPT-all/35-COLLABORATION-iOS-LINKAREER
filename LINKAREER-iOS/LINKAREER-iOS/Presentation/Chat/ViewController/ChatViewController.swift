//
//  ChatViewController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class ChatViewController: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = ChatView()
    
    var categoryDummy = ChatCategoryList.categoryDummy()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setHierarchy()
        setLayout()
        
        setDelegate()
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension ChatViewController {
    func setHierarchy() {
        view.addSubview(rootView)
    }
    
    func setLayout() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        rootView.categoryCollectionView.delegate = self
        rootView.categoryCollectionView.dataSource = self
    }
    
    func setRegister() {
        rootView.categoryCollectionView.register(CategoryCollectionViewCell.self,
                                                 forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rootView.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        let data = categoryDummy[indexPath.item]
        cell.configure(data: data)
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        // index에 따라서 list 분기처리
    }
}
