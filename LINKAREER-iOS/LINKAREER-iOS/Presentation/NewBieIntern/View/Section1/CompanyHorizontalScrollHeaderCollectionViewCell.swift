//
//  CompanyHorizontalScrollHeaderCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class CompanyHorizontalScrollHeaderCollectionViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private var noTagHeader: NoTagHeaderModel?
    private var categories: [ChatCategoryList] = []

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
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 8
        }
        collectionView.backgroundColor = .clear
    }
    
    private func registerCell() {
        collectionView.register(HorizontalCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCategoryCollectionViewCell.identifier)
        collectionView.register(
            NoTagHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NoTagHeaderView.identifier
        )
    }
}

extension CompanyHorizontalScrollHeaderCollectionViewCell {
    
    func configure(with categories: [ChatCategoryList], noTagHeaderData: NoTagHeaderModel) {
        self.categories = categories
        self.noTagHeader = noTagHeaderData
        collectionView.reloadData()
    }
}

extension CompanyHorizontalScrollHeaderCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HorizontalCategoryCollectionViewCell.identifier,
            for: indexPath
        ) as? HorizontalCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(categories: categories.map { $0.category })
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: NoTagHeaderView.identifier,
                for: indexPath
            ) as? NoTagHeaderView else {
                return UICollectionReusableView()
            }
            
            if let noTagHeader = noTagHeader {
                header.configure(noTagHeaderData: noTagHeader)
            }
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 40)
    }
}



struct CompanyHorizontalScrollHeaderCollectionViewCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let cell = CompanyHorizontalScrollHeaderCollectionViewCell()
        let categories = ChatCategoryList.categoryDummy()
        let noTagHeaderData = NoTagHeaderModel(nickname: "머리", title: "어깨 무릅")
        cell.configure(with: categories, noTagHeaderData: noTagHeaderData)
        return cell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CompanyHorizontalScrollHeaderCollectionViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        CompanyHorizontalScrollHeaderCollectionViewCellPreview()
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
