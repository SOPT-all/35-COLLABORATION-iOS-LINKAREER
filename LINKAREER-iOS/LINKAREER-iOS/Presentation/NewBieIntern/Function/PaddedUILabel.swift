//
//  sd.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit

//이거 swift ui의 padding 같은 기능을 해줌
class PaddedUILabel: UILabel {

    var padding: UIEdgeInsets = .zero

    override func drawText(in rect: CGRect) {
        let paddedRect = rect.inset(by: padding)
        super.drawText(in: paddedRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + padding.left + padding.right,
            height: size.height + padding.top + padding.bottom
        )
    }
}
