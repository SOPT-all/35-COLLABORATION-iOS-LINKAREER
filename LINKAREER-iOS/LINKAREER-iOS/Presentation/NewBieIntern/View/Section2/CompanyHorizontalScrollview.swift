//
//  CompanyHorizontalScrollview.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit

import SnapKit
import Then


class CompanyHorizontalScrollCollectionViewCell: UICollectionViewCell {

    weak var delegate: BookMarkDelegate?
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private var data: [CompanyDayCardModel] = []

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
        contentView.addSubview(collectionView)
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
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 8
            layout.itemSize = CGSize(width: 142, height: 255)
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }


}


extension CompanyHorizontalScrollCollectionViewCell {

    private func registerCell() {
        collectionView.register(CompanyDayCardCell.self, forCellWithReuseIdentifier: CompanyDayCardCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }

    // 컬렉션 뷰에 표시할 데이터 배열
    func configure(with data: [CompanyDayCardModel]) {
        self.data = data
        collectionView.reloadData()
    }
}

extension CompanyHorizontalScrollCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView:
        UICollectionView, numberOfItemsInSection
        section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CompanyDayCardCell.identifier,
            for: indexPath
        ) as? CompanyDayCardCell else {
            return UICollectionViewCell()
        }
        let item = data[indexPath.item]
        cell.configure(with:item)
        cell.delegate = delegate
        return cell
    }

    // 섹션의 여백 설정, 이걸로 이전 previousCard if문 대체
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
