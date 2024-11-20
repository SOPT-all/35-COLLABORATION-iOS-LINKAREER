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

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 8
            $0.itemSize = CGSize(width: 142, height: 255)
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }()

    private var data: [CompanyDayCardDataModel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
        setDelegate()
        setRegister()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CompanyHorizontalScrollCollectionViewCell {

    private func setHierarchy() {
        contentView.addSubview(collectionView)
    }

    private func setRegister() {
        collectionView.register(CompanyDayCardCell.self, forCellWithReuseIdentifier: CompanyDayCardCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
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

    // 컬렉션 뷰에 표시할 데이터 배열
    func configure(with data: [CompanyDayCardDataModel]) {
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
        cell.configure(
            day: item.day,
            image: item.image,
            buttonTitle: item.buttonTitle,
            companyName: item.companyName,
            title: item.title,
            category: item.category,
            viewCount: item.viewCount,
            commentCount: item.commentCount
        )
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
