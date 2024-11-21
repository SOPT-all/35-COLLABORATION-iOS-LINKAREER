//
//  HomeViewController.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/17/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let homeView: HomeView = HomeView()
    
    // MARK: - Properties
    
    private let dataSource: [HomeSection] = HomeSection.dataSource
    
    private var tagHeader: [TagHeader] = TagHeader.headerData
    private var categorySelector: [CategorySelector] = CategorySelector.dummyData
    private var homeBanners: [HomeBanner] = HomeBanner.dummyData
    private var interestBoard: [Board] = Board.dummyData
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
    }
    
    func setHierarchy() {
        self.view.addSubview(homeView)
    }
    
    func setLayout() {
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .lkWhite
    }
    
    func setDelegate() {
        homeView.mainCollectionView.delegate = self
        homeView.mainCollectionView.dataSource = self
    }
    
    func registerCell() {
        homeView.mainCollectionView.do {
            $0.register(HomeBannerCell.self, forCellWithReuseIdentifier: HomeBannerCell.identifier)
            $0.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)
            $0.register(CategorySelectorCell.self, forCellWithReuseIdentifier: CategorySelectorCell.identifier)
            $0.register(TagHeaderView.self, forSupplementaryViewOfKind: TagHeaderView.identifier, withReuseIdentifier: TagHeaderView.identifier)
            $0.register(BottomPageControlView.self, forSupplementaryViewOfKind: BottomPageControlView.identifier, withReuseIdentifier: BottomPageControlView.identifier)
            $0.register(PolicyFooterView.self, forSupplementaryViewOfKind: PolicyFooterView.identifier, withReuseIdentifier: PolicyFooterView.identifier)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .homeBanner:
            return homeBanners.count
        case .catecoryBoard:
            return categorySelector.count
        case .interestBoard:
            return interestBoard.count
        case .recommendRecruit:
            return interestBoard.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.dataSource[indexPath.section] {
        case .homeBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.identifier, for: indexPath) as? HomeBannerCell else {
                fatalError("Unable to dequeue HomeBannerCell")
            }
            let banner = homeBanners[indexPath.row]
            cell.configure(with: banner)
            return cell
        case .catecoryBoard:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategorySelectorCell.identifier, for: indexPath) as? CategorySelectorCell else {
                fatalError("Unable to dequeue CategorySelectorCell")
            }
            let category = categorySelector[indexPath.row]
            let isSelected = indexPath.row == 0 
            cell.configure(with: category, isSelected: isSelected)
            return cell
        case .interestBoard, .recommendRecruit:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as? BoardCell else {
                fatalError("Unable to dequeue BoardCell")
            }
            let board = interestBoard[indexPath.row]
            cell.configure(with: board)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == TagHeaderView.identifier {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TagHeaderView.identifier, for: indexPath) as? TagHeaderView else {
                return UICollectionReusableView()
            }
            let tagHeaderInfo = tagHeader[indexPath.section]
            header.configure(headerData: tagHeaderInfo)
            return header
        } else if kind == BottomPageControlView.identifier {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BottomPageControlView.identifier, for: indexPath) as? BottomPageControlView else {
                return UICollectionReusableView()
            }
            return footer
        } else if kind == PolicyFooterView.identifier {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PolicyFooterView.identifier, for: indexPath) as? PolicyFooterView else {
                return UICollectionReusableView()
            }
            return footer
        } else {
            return UICollectionReusableView()
        }
    }
    
}

