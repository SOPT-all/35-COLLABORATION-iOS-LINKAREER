//
//  CompanyMentorCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

final class CompanyMentorCollectionViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let bottomButton: ChatReSearchButtonView = ChatReSearchButtonView()
    
    private var tagHeaderData: TagHeader?
    private var chatListData: [ChatList] = []
    
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
        addSubviews(collectionView,bottomButton)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(40)
            $0.height.equalTo(36)
            $0.width.equalTo(150)
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
            layout.minimumInteritemSpacing = 0
        }
        collectionView.backgroundColor = .clear
    }
    
    private func registerCell() {
        collectionView.register(
            TagHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TagHeaderView.identifier
        )
        collectionView.register(
            ChatListCollectionViewCell.self,
            forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier
        )
    }
}

extension CompanyMentorCollectionViewCell {
    
    func configure(with tagHeaderData: TagHeader, chatListData: [ChatList]) {
        self.tagHeaderData = tagHeaderData
        self.chatListData = chatListData
        collectionView.reloadData()
    }
}

extension CompanyMentorCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatListCollectionViewCell.identifier,
            for: indexPath
        ) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: chatListData[indexPath.item])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width , height: 97)
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
            if let tagHeaderData = tagHeaderData {
                header.configure(headerData: tagHeaderData)
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
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }

}


struct CompanyMentorCollectionViewCellPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let cell = CompanyMentorCollectionViewCell()
        
        
        let tagHeaderData = TagHeader(
            nickname: "UX/UI",
            title: "직무 취준생들의 이야기",
            discription: "에 대한 이야기가 화두예요.",
            tags: ["산학", "대학원", "인턴 경험"]
        )
        let chatListData = ChatList.listDummy()
        
        cell.configure(with: tagHeaderData, chatListData: chatListData)
        
        return cell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CompanyMentorCollectionViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        CompanyMentorCollectionViewCellPreview()
            .frame(width: UIScreen.main.bounds.width, height: 400)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
