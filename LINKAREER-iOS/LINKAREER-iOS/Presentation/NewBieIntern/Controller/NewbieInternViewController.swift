//
//  NewbieIntern.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then


class NewbieInternViewController: UIViewController {
    
    private let collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var noTagHeaderDataInFirstSection: NoTagHeaderModel? // Section 1 헤더 데이터
    private var CategoriesInFirstSection: [ChatCategoryList] = []
    
    
    private var companyDayData: [CompanyDayCardModel] = [] // Section2
    private var jobSuccessData: [SectionTitleModel] = [] // Section 3
    private var jobGuideData: [CompanyBigCardDataModel] = [] // Section 4
    private var mentorPostCategories: [ChatCategoryList] = [] // Section 5
    private var mentorPostBoards: [Board] = [] // Section 5
    
    private var mentorPostHeader: TagHeader? // Section 5의 header
    private var noTagTitleData: NoTagHeaderModel? // Section 2의 header
    
    private var tagTitleData: TagHeader? // Section 3의 header
    
    //section 6
    private var tagHeaderData: TagHeader?
    private var chatListData: [ChatList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setStyle()
        setRegister()
        setLayout()
        fetchData()
        setDelegate()
        getCardList()
    }
    
    private func setHierarchy(){
        view.addSubview(collectionView)
    }
    
    private func setStyle() {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(
                top: 16,
                left: 16,
                bottom: 16,
                right: 16
            )
        }
        collectionView.backgroundColor = .white
    }
    
    private func setRegister() {
        
        collectionView.register(
            NewbieHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NewbieHeaderView.identifier
        )
        
        collectionView.register(CompanyHorizontalScrollHeaderCollectionViewCell.self, forCellWithReuseIdentifier: CompanyHorizontalScrollHeaderCollectionViewCell.identifier)
        collectionView.register(CompanyHorizontalScrollCollectionViewCell.self, forCellWithReuseIdentifier: CompanyHorizontalScrollCollectionViewCell.identifier)
        collectionView.register(JobSuccessCollectionViewCell.self, forCellWithReuseIdentifier: JobSuccessCollectionViewCell.identifier)
        collectionView.register(JobCompanyGuideViewCell.self, forCellWithReuseIdentifier: JobCompanyGuideViewCell.identifier)
        collectionView.register(MentorPostViewCell.self, forCellWithReuseIdentifier: MentorPostViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        collectionView.register(CompanyMentorCollectionViewCell.self, forCellWithReuseIdentifier: CompanyMentorCollectionViewCell.identifier)
        
        collectionView.register(
            PolicyFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: PolicyFooterView.identifier
        )
        
    }
    
    private func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview()
        }
    }
}

extension NewbieInternViewController {
    
    private func fetchData() {
        
        // 겟션 1
        noTagHeaderDataInFirstSection = NoTagHeaderModel(nickname: "만수무강", title: "어깨 무릎")
        CategoriesInFirstSection = ChatCategoryList.categoryDummy()
        
        // 섹션 2
        //        companyDayData = CompanyDayCardModelData.shared.allCard
        
        // 섹션 3
        jobSuccessData = SectionTitleModelData.shared.allSections
        
        // 섹션 4
        noTagTitleData = NoTagHeaderModelData.shared.title2
        jobGuideData = CompanyBigCardDataModelData.shared.allCellData
        
        // 섹션 5
        mentorPostCategories = [
            ChatCategoryList(category: "Q&A"),
            ChatCategoryList(category: "취업"),
            ChatCategoryList(category: "이직")
        ]
        mentorPostBoards = Board.dummyData
        mentorPostHeader = TagHeader.headerData.first
        
        // 섹션 6
        tagHeaderData = TagHeader.headerData[2]
        chatListData = ChatList.listDummy()
        
        collectionView.reloadData()
    }
}

extension NewbieInternViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return configureCompanyHorizontalScrollHeaderCell(for: collectionView, at: indexPath)
        case 1:
            return configureHorizontalScrollCell(for: collectionView, at: indexPath)
        case 2:
            return configureJobSuccessCell(for: collectionView, at: indexPath)
        case 3:
            return configureJobCompanyGuideCell(for: collectionView, at: indexPath)
        case 4:
            return configureMentorPostViewCell(for: collectionView, at: indexPath)
        case 5:
            return configureCompanyMentorCollectionViewCell(for: collectionView, at: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.92
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 90)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 255)
        case 2:
            return CGSize(width: width, height: 430)
        case 3:
            return CGSize(width: width, height: 520)
        case 4:
            return CGSize(width: width, height: 630)
        case 5:
            return CGSize(width: width, height: 400)
        default:
            return .zero
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 20, left: 16, bottom: 10, right: 16)
        case 1:
            return UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        case 2:
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        case 3:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        case 4:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        case 5:
            return UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        default:
            return .zero
        }
    }
    
    // header size
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 50)
        default:
            return .zero
        }
    }
    
    // footer size
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForFooterInSection section: Int
    ) -> CGSize {
        return section == 5 ? CGSize(width: collectionView.bounds.width, height: 80) : .zero
    }
    
    // header & footer set
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 0 {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: NewbieHeaderView.identifier,
                for: indexPath
            ) as? NewbieHeaderView else {
                return UICollectionReusableView()
            }
            return header
        }
        
        if kind == UICollectionView.elementKindSectionFooter && indexPath.section == 5 {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: PolicyFooterView.identifier,
                for: indexPath
            ) as? PolicyFooterView else {
                return UICollectionReusableView()
            }
            return footer
        }
        return UICollectionReusableView()
    }
    
    //Section 1
    private func configureCompanyHorizontalScrollHeaderCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyHorizontalScrollHeaderCollectionViewCell.identifier,
            for: indexPath
        ) as! CompanyHorizontalScrollHeaderCollectionViewCell
        
        if let noTagHeader = noTagHeaderDataInFirstSection {
            cell.configure(with: CategoriesInFirstSection, noTagHeaderData: noTagHeader)
        }
        
        return cell
    }
    
    // Section 2
    private func configureHorizontalScrollCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyHorizontalScrollCollectionViewCell.identifier,
            for: indexPath
        ) as! CompanyHorizontalScrollCollectionViewCell
        cell.configure(with: companyDayData)
        return cell
    }
    
    // Section 3
    private func configureJobSuccessCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: JobSuccessCollectionViewCell.identifier,
            for: indexPath
        ) as! JobSuccessCollectionViewCell
        
        let dummyData = SectionTitleModelData.shared.allSections
        if let dummyTitleData = TagHeader.headerData.first {
            cell.configure(with: dummyData, tagHeader: dummyTitleData)
        }
        return cell
    }
    
    // Section 4
    private func configureJobCompanyGuideCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: JobCompanyGuideViewCell.identifier,
            for: indexPath
        ) as! JobCompanyGuideViewCell
        
        let dummyData = CompanyBigCardDataModelData.shared.allCellData
        let dummyTitleData = NoTagHeaderModelData.shared.title2
        cell.configure(with: dummyData, noTagHeaderData: dummyTitleData)
        
        return cell
    }
    
    // Section 5
    private func configureMentorPostViewCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MentorPostViewCell.identifier,
            for: indexPath
        ) as! MentorPostViewCell
        
        if let header = mentorPostHeader {
            cell.configure(with: mentorPostCategories, boards: mentorPostBoards, tagHeaderData: header)
        }
        
        return cell
    }
    
    // Section 6
    private func configureCompanyMentorCollectionViewCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyMentorCollectionViewCell.identifier,
            for: indexPath
        ) as! CompanyMentorCollectionViewCell
        
        if let tagHeaderData = tagHeaderData {
            cell.configure(with: tagHeaderData, chatListData: chatListData)
        }
        return cell
    }
}


extension NewbieInternViewController {
    
    func getCardList() {
        // HomeService의 getPostList 호출
        NetworkService.shared.newbieService.getPostList(category: "recommend") { [weak self] response in
            guard self != nil else { return }
            
            switch response {
            case .success(let officialList):
                // 성공적으로 데이터를 가져왔을 때
                // 서버에서 받은 데이터를 모델에 매핑
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
                
                
                // UI 업데이트
                DispatchQueue.main.async {
                    self?.companyDayData = convertedData // 게시물 리스트 업데이트
                    self?.collectionView.reloadData() // 컬렉션 뷰 갱신
                }
                
                // 요청 오류 발생 시 처리 > 네트워크 성공적으로 연결 시 default로 한번에 처리해도 됨!
            case .requestErr:
                // 요청 오류 발생 시
                print("요청 오류입니다")
            case .decodedErr:
                // 디코딩 오류 발생 시
                print("디코딩 오류입니다")
            case .pathErr:
                // 경로 오류 발생 시
                print("경로 오류입니다")
            case .serverErr:
                // 서버 오류 발생 시
                print("서버 오류입니다")
            case .networkFail:
                // 네트워크 오류 발생 시
                print("네트워크 오류입니다")
            }
        }
    }
    
}

//preview

struct NewPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NewbieInternViewController {
        return NewbieInternViewController()
    }
    
    func updateUIViewController(_ uiViewController: NewbieInternViewController, context: Context) {}
}

struct NewbieIPreviews: PreviewProvider {
    static var previews: some View {
        NewPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
