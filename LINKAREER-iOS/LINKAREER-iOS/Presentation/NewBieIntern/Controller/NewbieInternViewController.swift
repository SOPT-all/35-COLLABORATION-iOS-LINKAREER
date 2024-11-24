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
    
    private var companyDayData: [CompanyDayCardModel] = [] // Section2
    private var jobSuccessData: [SectionTitleModel] = [] // Section 3
    private var jobGuideData: [CompanyBigCardDataModel] = [] // Section 4

    private var noTagTitleData: NoTagHeaderModel?
    
    private var otherSectionData: [String] = [] // 더미 데이터
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setStyle()
        setRegister()
        setLayout()
        fetchData()
        setDelegate()
    }
    
    // 추후 추가된 뷰를 위해 함수 선언
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
        collectionView.register(CompanyHorizontalScrollCollectionViewCell.self, forCellWithReuseIdentifier: CompanyHorizontalScrollCollectionViewCell.identifier)
        collectionView.register(JobSuccessCollectionViewCell.self, forCellWithReuseIdentifier: JobSuccessCollectionViewCell.identifier)
        collectionView.register(JobCompanyGuideViewCell.self, forCellWithReuseIdentifier: JobCompanyGuideViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }
    
    private func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(2500)
        }
    }
}

extension NewbieInternViewController {
    
    //임시 데이터
    private func fetchData() {
        // 섹션 2
        companyDayData = CompanyDayCardModelData.shared.allCard
        
        // 섹션 3
        jobSuccessData = SectionTitleModelData.shared.allSections
        
        // 섹션 4
        noTagTitleData = NoTagHeaderModelData.shared.title2
        jobGuideData = CompanyBigCardDataModelData.shared.allCellData
        
        // 더미
        otherSectionData = (1...5).map { "더미 데이터 \($0)" }
        collectionView.reloadData()
    }
}

extension NewbieInternViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return configureHorizontalScrollCell(for: collectionView, at: indexPath)
        case 1:
            return configureJobSuccessCell(for: collectionView, at: indexPath)
        case 2:
            return configureJobCompanyGuideCell(for: collectionView, at: indexPath)
        case 3:
            return configureDummyCell(for: collectionView, at: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    // 레이아웃
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 255)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
        case 2:
            return CGSize(width: 347, height: 520)
        case 3:
            return CGSize(width: collectionView.bounds.width, height: 50)
        default:
            return .zero
        }
    }
    
    private func configureHorizontalScrollCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyHorizontalScrollCollectionViewCell.identifier,
            for: indexPath
        ) as! CompanyHorizontalScrollCollectionViewCell
        cell.configure(with: companyDayData) // 데이터를 주입
        return cell
    }
    
    private func configureJobSuccessCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: JobSuccessCollectionViewCell.identifier,
            for: indexPath
        ) as! JobSuccessCollectionViewCell
        
        let dummyData = SectionTitleModelData.shared.allSections
        cell.configure(with: dummyData)
        
        return cell
    }
    
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
    
    
    private func configureDummyCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: UICollectionViewCell.identifier,
            for: indexPath
        )
        cell.backgroundColor = .lightGray
        let label = UILabel().then {
            $0.text = "더미 데이터"
            $0.textAlignment = .center
        }
        cell.contentView.addSubview(label)
        label.snp.makeConstraints { $0.edges.equalToSuperview() }
        return cell
    }
    
    
}


//preview

struct NewbieInternViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NewbieInternViewController {
        return NewbieInternViewController()
    }
    
    func updateUIViewController(_ uiViewController: NewbieInternViewController, context: Context) {}
}

struct NewbieInternViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        NewbieInternViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
