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
    var listDummy = ChatList.listDummy()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setHierarchy()
        setLayout()
        
        setDelegate()
        setRegister()
        setAddTarget()
        
        defaultSelectCategoryCell()
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
        rootView.listCollectionView.delegate = self
        rootView.listCollectionView.dataSource = self
    }
    
    func setRegister() {
        rootView.categoryCollectionView.register(CategoryCollectionViewCell.self,
                                                 forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        rootView.listCollectionView.register(ChatListCollectionViewCell.self,
                                             forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
        
    }
    
    func setAddTarget() {
        rootView.myChatButton.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        rootView.entireChatButton.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
    }
}

extension ChatViewController {
    
    @objc func buttonDidTapped(_ sender: UIButton) {
        if sender == rootView.myChatButton {
            updateButtonColor(for: rootView.myChatButton)
        } else if sender == rootView.entireChatButton {
            updateButtonColor(for: rootView.entireChatButton)
        }
    }
    
    func updateButtonColor(for selectedButton: UIButton) {
        let allButtons = [rootView.myChatButton, rootView.entireChatButton]
        allButtons.forEach { button in
            button.setTitleColor(button == selectedButton ? .gray900 : .gray600, for: .normal)
        }
    }
    
    func defaultSelectCategoryCell() {
        let indexPathToSelect = IndexPath(item: 1, section: 0)
        rootView.categoryCollectionView.selectItem(at: indexPathToSelect, animated: false, scrollPosition: [])
        collectionView(rootView.categoryCollectionView, didSelectItemAt: indexPathToSelect)
    }
}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rootView.categoryCollectionView {
            return categoryDummy.count
        } else if collectionView == rootView.listCollectionView {
            return listDummy.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == rootView.categoryCollectionView {
            guard let cell = rootView.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            let data = categoryDummy[indexPath.item]
            cell.configure(data: data)
            return cell
        }
        else if collectionView == rootView.listCollectionView {
            guard let cell = rootView.listCollectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as? ChatListCollectionViewCell else { return UICollectionViewCell() }
            let data = listDummy[indexPath.item]
            if data.secondTagLabel == "" { cell.secondTagLabel.isHidden = true }
            cell.configure(data: data)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ChatViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == rootView.categoryCollectionView {
            let idx = indexPath.item
            if idx == 3 {
                rootView.totalCountLabel.isHidden = true
                rootView.listCollectionView.isHidden = true
                rootView.emptyView.isHidden = false
            } else {
                rootView.totalCountLabel.isHidden = false
                rootView.listCollectionView.isHidden = false
                rootView.emptyView.isHidden = true
            }
        }
        else if collectionView == rootView.listCollectionView {
            print("Cell Tapped")
            //TODO: - Chatting Room 으로 이동
        }
    }
}
