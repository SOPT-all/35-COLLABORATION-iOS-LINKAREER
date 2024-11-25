//
//  MentorPostViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class MentorPostViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private var tagHeader: TagHeader?
    private var boards: [Board] = []
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
            layout.minimumLineSpacing = 16
            layout.minimumInteritemSpacing = 0
        }
        collectionView.backgroundColor = .clear
    }
    
    private func registerCell() {
        collectionView.register(HorizontalCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCategoryCollectionViewCell.identifier)
        collectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)
        collectionView.register(
            TagHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TagHeaderView.identifier
        )
    }
}

extension MentorPostViewCell {
    
    func configure(with categories: [ChatCategoryList], boards: [Board], tagHeaderData: TagHeader) {
        self.categories = categories
        self.boards = boards
        self.tagHeader = tagHeaderData
        collectionView.reloadData()
    }
}

extension MentorPostViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 3 // 첫 번째 섹션 1개, 두 번째 섹션 3개
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HorizontalCategoryCollectionViewCell.identifier,
                for: indexPath
            ) as? HorizontalCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(categories: categories.map { $0.category })
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BoardCell.identifier,
                for: indexPath
            ) as? BoardCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: boards[indexPath.item])
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 40)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 150)
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: TagHeaderView.identifier,
                for: indexPath
            ) as? TagHeaderView else {
                return UICollectionReusableView()
            }
            if let tagHeader = tagHeader {
                header.configure(headerData: tagHeader)
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
        return section == 0 ? CGSize(width: collectionView.bounds.width, height: 64) : .zero
    }
}


//preview

struct MentorPostViewCellPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let cell = MentorPostViewCell()
        

        let categories = [
            ChatCategoryList(category: "Q&A"),
            ChatCategoryList(category: "취업"),
            ChatCategoryList(category: "이직")
        ]
        let boards = Board.dummyData
        let tagHeaderData = TagHeader.headerData.first ?? TagHeader(
            nickname: "무야호",
            title: "제목",
            discription: "디스크립션",
            tags: ["태그임", "123"]
        )

        cell.configure(with: categories, boards: boards, tagHeaderData: tagHeaderData)
        
        return cell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct MentorPostViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        MentorPostViewCellPreview()
            .frame(width: UIScreen.main.bounds.width, height: 600)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
