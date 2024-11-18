//
//  AppFontStyle.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/18/24.
//

import UIKit

enum fontStyle {
    case title1_b_20
    case title2_b_17
    case title3_b_15
    case body1_b_15
    case body2_b_14
    case body3_b_13
    case body4_b_12
    case body5_m_16
    case body6_m_15
    case body7_m_14
    case body8_m_13
    case body9_m_12
    case body10_r_14
    case body11_r_13
    case body12_r_12
    case body13_r_11
    case label1_b_12
    case label2_b_11
    case label3_b_10
    case label4_b_9
    case label5_m_11
    case label6_m_10
    case label7_m_8
    
    // 폰트 크기
    var fontSize: CGFloat {
        switch self {
        case .title1_b_20: return 18
        case .title2_b_17: return 17
        case .body5_m_16: return 16
        case .title3_b_15, .body1_b_15, .body6_m_15: return 15
        case .body2_b_14, .body10_r_14, .body7_m_14: return 14
        case .body3_b_13, .body8_m_13, .body11_r_13: return 13
        case .body4_b_12, .body9_m_12, .body12_r_12, .label1_b_12: return 12
        case .body13_r_11, .label2_b_11, .label5_m_11: return 11
        case .label3_b_10, .label6_m_10: return 10
        case .label4_b_9: return 9
        case .label7_m_8: return 8
        }
    }
    
    // (Bold = 700, Medium = 500, Regular = 400)
    var weight: String {
        switch self {
        case .title1_b_20, .title2_b_17, .title3_b_15, .body1_b_15, .body2_b_14, .body3_b_13, .body4_b_12,
                .label1_b_12, .label2_b_11, .label3_b_10, .label4_b_9:
            return "NotoSansKR-Bold"
        case .body5_m_16, .body6_m_15, .body7_m_14, .body8_m_13, .body9_m_12, .label5_m_11, .label6_m_10, .label7_m_8:
            return "NotoSansKR-Medium"
        case .body10_r_14, .body11_r_13, .body12_r_12, .body13_r_11:
            return "NotoSansKR-Regular"
        }
    }
    
    var letterSpacing: CGFloat {
        switch self {
        case .title1_b_20, .title3_b_15, .body1_b_15, .body9_m_12: return -4
        case .title2_b_17, .body2_b_14, .body7_m_14: return 1
        case .body3_b_13, .body4_b_12, .body5_m_16: return -2
        case .body6_m_15, .body8_m_13, .label1_b_12: return -3
        case .body10_r_14, .body11_r_13, .body12_r_12, .body13_r_11: return -4
        case .label2_b_11, .label3_b_10, .label5_m_11: return -3
        case .label4_b_9, .label6_m_10, .label7_m_8: return -4
            
        }
    }
    
    var lineHeight: CGFloat? {
        switch self {
        case .body4_b_12, .body9_m_12: return 150
        case .body10_r_14, .body11_r_13, .body12_r_12, .body13_r_11: return 175
        default: return nil
        }
    }
    
    // 커스텀 폰트적용, 사이즈 적용
    func font() -> UIFont {
        return UIFont(name: self.weight, size: self.fontSize) ?? UIFont.systemFont(ofSize: self.fontSize)
    }

    
    // AttributedString을 반환하는 메소드
    func attributedText(for text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // LetterSpacing 설정
        attributedString.addAttribute(.kern, value: self.letterSpacing, range: NSRange(location: 0, length: text.count))
        
        // LineHeight 설정
        if let lineHeight = self.lineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
            
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.count))
        }
        
        // 폰트 적용
        attributedString.addAttribute(.font, value: self.font(), range: NSRange(location: 0, length: text.count))
        
        return attributedString
    }
}
