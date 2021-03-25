//
//  UIFont+Extension.swift
//  Runners_Hi
//
//  Created by 김민희 on 2021/03/26.
//  Copyright © 2021 김민희. All rights reserved.
//

import UIKit

extension UIFont {
    
    // Custom 폰트를 쉽게 적용하는 Extension
    // 사용법 : mentLabel.font = UIFont.nanumBold(size: 22)
    
    // MARK: NanumSquare Font
    
    class func nanumBold(size: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareB", size: size)!
    }
    
    class func nanumRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareR", size: size)!
    }
    
    // MARK: AvenirNext BoldItalic Font (숫자용)
    
    class func numberFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-BoldItalic", size: size)!
    }
    
}
