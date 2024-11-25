//
//  ScrollviewHeaderViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class HorizontalCategoryCollectionViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    
    private var categories: [String] = []
    private let categoryDummy = ChatCategoryList.categoryDummy()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        registerCell()
    }
    
    private func setHierarchy() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 7
            layout.minimumLineSpacing = 7
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCell() {
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
    }
}


extension HorizontalCategoryCollectionViewCell {
        
    func configure(categories: [String]) {
        self.categories = categories
        collectionView.reloadData()
    }
}

extension HorizontalCategoryCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
        let categoryDummy = ChatCategoryList.categoryDummy()

        cell.configure(data: categoryDummy[indexPath.item])
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}

//프리뷰
struct HorizontalCategoryCollectionViewCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let cell = HorizontalCategoryCollectionViewCell()
        cell.configure(categories: ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5"])
        return cell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct HorizontalCategoryCollectionViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCategoryCollectionViewCellPreview()
            .frame(width: 400, height: 50)
    }
}
