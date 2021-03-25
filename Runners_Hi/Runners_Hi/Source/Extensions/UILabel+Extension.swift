//
//  UILabel+Extension.swift
//  Runners_Hi
//
//  Created by 김민희 on 2021/03/26.
//  Copyright © 2021 김민희. All rights reserved.
//

import UIKit

extension UILabel {
    
    // MARK: Label Style Function
    // 사용법 : infoLabel.setLabel(text: "민희", color: .white, font: ..nanumBold(size: 22))
    
    func setLabel(text: String, color: UIColor, font: UIFont) {
        
        self.text = text
        self.font = font
        self.textColor = color
    }
    
    // MARK: 자간/행간 Custom Style Function
    // 사용법: MyLabel.lineSetting(kernValue: -0.8, lineSpacing: 10),  MyLabel.lineSetting(ineSpacing: 10), MyLabel.lineSetting(kernValue: -0.5)

    func lineSetting(kernValue: Double = 1.15, lineSpacing: CGFloat = 0.0) {
    // kernValue: 자간, lineSpacing : 행간
    // 사용에 따라 kernValue만, 또는 lineSpacing만 넣을 수도 있다
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        // Text Storage의 Class로 문자열에 속성을 추가해주는 역할
        
        paragraphStyle.lineSpacing = lineSpacing
        // 행간 설정
        
        var attributedString = NSMutableAttributedString(string: labelText)
        // Strings and Text의 Class로 데이터가 존재하는 String에 속성을 적용해주는 역할
        
        if let labelattributedText = self.attributedText {
            // 특별하게 바꿀 부분만 선언해준다 (여기서는 자간)
            
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
            
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            //  addAttribute( 바꿀 옵션, 값, 해당 위치 )
            // 글자 전체에 자간값을 적용시켜준다
            
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        // addAttribute( 바꿀 옵션, 값, 해당 위치
        // 행간을 설정해 둔 것을 자간을 적용시켜둔 text에 포함해준다
        
        self.attributedText = attributedString
    }
    
}
