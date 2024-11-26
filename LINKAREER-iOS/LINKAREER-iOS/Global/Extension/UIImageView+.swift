//
//  UIImageView+.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import UIKit

import Kingfisher

extension UIImageView {
    
    func kfSetImage(with urlString: String?, placeholder: UIImage? = nil) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: [.transition(.none), .cacheOriginalImage,])
    }
    
}
