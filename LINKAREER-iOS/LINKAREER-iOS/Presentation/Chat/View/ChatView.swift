//
//  ChatView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import  UIKit

import Then
import SnapKit

final class ChatView: UIView {
    
    lazy var myChatButton: UIButton = UIButton()
    lazy var entireChatButton: UIButton = UIButton()
    
    let totalCountLabel: UILabel = UILabel()
    
    let categoryCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let listCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let emptyView = EmptyView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ChatView {
    
    func setHierarchy() {
        addSubviews(myChatButton, entireChatButton, totalCountLabel, categoryCollectionView, listCollectionView, emptyView)
    }
    
    func setLayout() {
        myChatButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(66)
            $0.leading.equalToSuperview().inset(14)
            $0.height.equalTo(40)
        }
        
        entireChatButton.snp.makeConstraints {
            $0.top.equalTo(myChatButton)
            $0.leading.equalTo(myChatButton.snp.trailing).offset(5)
            $0.height.equalTo(40)
        }
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(myChatButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(14)
            $0.height.equalTo(50)
            $0.width.equalTo(400)
        }
        
        totalCountLabel.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(14)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(totalCountLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(520)
            $0.width.equalTo(UIScreen.main.bounds.width - 28)
        }
        
        emptyView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(14)
        }
    }
    
    func setStyle() {
        myChatButton.do {
            $0.setTitle("내 채팅방", for: .normal)
            $0.setTitleColor(.gray900, for: .normal)
            $0.titleLabel?.font = fontStyle.title3_b_16.font()
            $0.backgroundColor = .clear
        }
        
        entireChatButton.do {
            $0.setTitle("전체 채팅방", for: .normal)
            $0.setTitleColor(.gray600, for: .normal)
            $0.titleLabel?.font = fontStyle.title3_b_16.font()
            $0.backgroundColor = .clear
        }
        
        totalCountLabel.do {
            $0.text = "총 6개"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        categoryCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 7
            layout.minimumLineSpacing = 7
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
        
        listCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 8
            layout.minimumLineSpacing = 8
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            $0.collectionViewLayout = layout
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .white
        }
    }
}
