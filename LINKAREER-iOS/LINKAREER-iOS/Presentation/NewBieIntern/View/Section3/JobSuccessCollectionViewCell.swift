//
//  JobSuccessCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/21/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class JobSuccessCollectionViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private var data: [SectionTitleModel] = []
    private var tagHeader: TagHeader?
    
    
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
            layout.itemSize = CGSize(width: collectionView.bounds.width, height: 180)
                        
        }
        collectionView.backgroundColor = .clear
    }
    
    private func registerCell() {
        collectionView.register(ForJobSuccessCollectionViewCell.self, forCellWithReuseIdentifier: ForJobSuccessCollectionViewCell.identifier)
        collectionView.register(
            TagHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TagHeaderView.identifier
        )
    }
    
    func configure(with sections: [SectionTitleModel], tagHeader: TagHeader) {
        self.data = sections
        self.tagHeader = tagHeader
        
        collectionView.reloadData()
    }
}

extension JobSuccessCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
            withReuseIdentifier: ForJobSuccessCollectionViewCell.identifier,
            for: indexPath
        ) as? ForJobSuccessCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let sectionData = data[indexPath.row]
        cell.configure(with: sectionData)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
            let width = collectionView.bounds.width 
            let height: CGFloat = 180
            return CGSize(width: width, height: height)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: 347, height: 40)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: TagHeaderView.identifier,
                for: indexPath
              ) as? TagHeaderView,
              let headerData = tagHeader else {
            return UICollectionReusableView()
        }
        header.configure(headerData: headerData)
        return header
    }
}

// MARK: - SwiftUI Preview

struct JobSuccessCollectionViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> JobSuccessCollectionViewCell {
        let view = JobSuccessCollectionViewCell(frame: .init(x: 0, y: 0, width: 555, height: 700))
        
        
        let dummyData = SectionTitleModelData.shared.allSections
        let dummyTagHeader = TagHeader(
            nickname: "sopt",
            title: "님이 관심 있을만한 공고",
            discription: "혜택이 있는 직무를 추천드립니다.",
            tags: ["추천 공고", "UX/UI", "디자인"]
        )
        
        view.configure(with: dummyData, tagHeader: dummyTagHeader)
        
        return view
    }
    
    func updateUIView(_ uiView: JobSuccessCollectionViewCell, context: Context) {}
}

struct JobSuccessCollectionViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        JobSuccessCollectionViewPreview()
            .previewLayout(.sizeThatFits)

    }
}
