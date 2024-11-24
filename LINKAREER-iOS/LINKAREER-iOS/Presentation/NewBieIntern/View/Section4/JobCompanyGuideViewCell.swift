//
//  JobCompanyGuideViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/22/24.
//

import UIKit
import SwiftUI
import SnapKit
import Then

class JobCompanyGuideViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private var data: [CompanyBigCardDataModel] = []
    private var noTagHeader: NoTagHeaderModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setDelegate()
        setStyle()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setStyle() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 350, height: 150)
            layout.minimumLineSpacing = 8
            layout.headerReferenceSize = CGSize(width: 0, height: 60)
        }
        collectionView.backgroundColor = .clear
    }

    private func registerCell() {
        collectionView.register(
            CompanyBigCardCell.self,
            forCellWithReuseIdentifier: CompanyBigCardCell.identifier
        )
        collectionView.register(
            NoTagHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NoTagHeaderView.identifier
        )
    }
    
    func configure(with CompanyBigCardData: [CompanyBigCardDataModel], noTagHeaderData: NoTagHeaderModel) {
        self.data = CompanyBigCardData
        self.noTagHeader = noTagHeaderData
        collectionView.reloadData()
    }
}

extension JobCompanyGuideViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyBigCardCell.identifier,
            for: indexPath
        ) as? CompanyBigCardCell else {
            return UICollectionViewCell()
        }
        
        let sectionData = data[indexPath.row]
        cell.configure(
            companyImage: sectionData.companyImage,
            companyName: sectionData.companyName,
            profileCraftPoint: sectionData.profileCraftPoint,
            aptitudeCheckPoint: sectionData.aptitudeCheckPoint,
            interviewPassPoint: sectionData.interviewPassPoint,
            finalSealPoint: sectionData.finalSealPoint
        )
        return cell
    }
    
    // 섹션의 패딩
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // 헤더를 반환하는 메서드
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: NoTagHeaderView.identifier,
                for: indexPath
              ) as? NoTagHeaderView,
              let headerData = noTagHeader else {
            return UICollectionReusableView()
        }
        header.configure(noTagHeaderData: headerData)
        return header
    }
}


/// Preview

struct JobCompanyGuideViewCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> JobCompanyGuideViewCell {
        let view = JobCompanyGuideViewCell(frame: .init(x: 0, y: 0, width: 1000, height: 1000))
        
        let dummyData = CompanyBigCardDataModelData.shared.allCellData
        let headerData = NoTagHeaderModel(nickname: "앤솝", title: "님이 관심 있을만한 공고")
        
        view.configure(with: dummyData, noTagHeaderData: headerData)
        
        return view
    }
    
    func updateUIView(_ uiView: JobCompanyGuideViewCell, context: Context) {}
}

struct JobCompanyGuideViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        JobCompanyGuideViewCellPreview()
            .previewLayout(.sizeThatFits)
            .frame(width: 400, height: 1000)
            .padding()
    }
}
