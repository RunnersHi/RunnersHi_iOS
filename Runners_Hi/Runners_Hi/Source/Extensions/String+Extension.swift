//
//  String+Extension.swift
//  Runners_Hi
//
//  Created by 김민희 on 2021/03/29.
//  Copyright © 2021 김민희. All rights reserved.
//

import UIKit

extension String {
    
    // utf8 로 인코딩 디코딩 하는 Extension
    
    func fromBase64URL() -> String? {
        
        var base64 = self
        base64 = base64.replacingOccurrences(of: "-", with: "+")
        base64 = base64.replacingOccurrences(of: "_", with: "/")
        while base64.count % 4 != 0 {
            base64 = base64.appending("=")
        }
        guard let data = Data(base64Encoded: base64) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64URL() -> String {
        
        var result = Data(self.utf8).base64EncodedString()
        result = result.replacingOccurrences(of: "+", with: "-")
        result = result.replacingOccurrences(of: "/", with: "_")
        result = result.replacingOccurrences(of: "=", with: "")
        return result
    }
}

