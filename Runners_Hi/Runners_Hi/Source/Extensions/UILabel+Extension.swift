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

}
