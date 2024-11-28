//
//  HomeViewController.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/17/24.
//

import UIKit

import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let homeView: HomeView = HomeView()
    private let newbieVC: NewbieInternViewController = NewbieInternViewController()
    
    // MARK: - Properties
    
    private let dataSource: [HomeSection] = HomeSection.dataSource
    
    private var tagHeader: [TagHeader] = TagHeader.headerData
    private var categorySelector: [CategorySelector] = CategorySelector.dummyData
    private var homeBanners: [HomeBanner] = HomeBanner.dummyData
    private var interestBoard: [Board] = Board.dummyData
    private var recommendRecruit: [CompanyDayCardModel] = []
    
    private var isInternScreenShown = false
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
        setActions()
        getCardList()
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
            $0.register(CompanyDayCardCell.self, forCellWithReuseIdentifier: CompanyDayCardCell.identifier)
            $0.register(TagHeaderView.self, forSupplementaryViewOfKind: TagHeaderView.identifier, withReuseIdentifier: TagHeaderView.identifier)
            $0.register(BottomPageControlView.self, forSupplementaryViewOfKind: BottomPageControlView.identifier, withReuseIdentifier: BottomPageControlView.identifier)
            $0.register(PolicyFooterView.self, forSupplementaryViewOfKind: PolicyFooterView.identifier, withReuseIdentifier: PolicyFooterView.identifier)
            $0.collectionViewLayout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.identifier)
        }
    }

    func setActions() {
        let buttons = homeView.segmentStackView.getButtons()
        for button in buttons {
            button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    func handleButtonTap(_ sender: UIButton) {
        let tagText = homeView.segmentStackView.tagTexts[sender.tag] // 버튼 텍스트 확인
        
        if tagText == "신입/인턴" {
            isInternScreenShown.toggle() // 상태 변경
            
            if isInternScreenShown {
                addBottomBorder(to: sender)
                print("신입/인턴 화면으로 전환!") // 화면 전환 로직
                loadNewbieInternViewController()
            } else {
                print("원래 화면으로 복귀!") // 복귀 로직
                removeBottomBorder(from: sender)
            }
        }
    }
    
    private func loadNewbieInternViewController() {
        addChild(newbieVC)
        view.addSubview(newbieVC.view)

        newbieVC.view.snp.makeConstraints {
            $0.top.equalTo(homeView.segmentStackView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        newbieVC.didMove(toParent: self)
    }
    
}

extension HomeViewController {
    
    func addBottomBorder(to button: UIButton) {
        button.addBottomBorder(color: .lkBlue, height: 4.0)
    }
    
    func removeBottomBorder(from button: UIButton) {
        button.removeBottomBorder()
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
            return recommendRecruit.count
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
        case .interestBoard:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as? BoardCell else {
                fatalError("Unable to dequeue BoardCell")
            }
            let board = interestBoard[indexPath.row]
            cell.configure(with: board)
            return cell
            
        case .recommendRecruit:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompanyDayCardCell.identifier, for: indexPath) as? CompanyDayCardCell else {
                fatalError("Unable to dequeue CompanyDayCardCell")
            }
            let item = recommendRecruit[indexPath.item]
            
            cell.configure(with: item)
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

extension HomeViewController {
    
    func getCardList() {

        NetworkService.shared.newbieService.getPostList(category: "recommend") { [weak self] response in
            guard self != nil else { return }
            
            switch response {
            case .success(let officialList):
                
                let convertedData = officialList.map { official in
                    CompanyDayCardModel(
                        dDay: official.dday,
                        imageUrl: official.imageUrl,
                        interestJob: official.interestJob,
                        companyName: official.companyName,
                        title: official.title,
                        tag: official.tag,
                        views: official.views,
                        comments: official.comments,
                        bookmark: official.bookmark
                    )
                }
                
                DispatchQueue.main.async {
                    self?.recommendRecruit = convertedData
                    self?.homeView.mainCollectionView.reloadData()
                }
                
            default:
                print("디폴트")
            }
        }
    }
    
}
