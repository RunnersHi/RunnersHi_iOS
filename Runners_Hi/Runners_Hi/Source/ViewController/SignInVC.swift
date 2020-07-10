//
//  SignInVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var idLoginTextField: UITextField!
    @IBOutlet weak var pwLoginTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextFieldSet()
        
    }
    
    
    
}

extension SignInVC {
    private func loginTextFieldSet(){
        idLoginTextField.addLeftPadding()
        idLoginTextField.layer.cornerRadius = 8.0
        idLoginTextField.layer.borderWidth = 1.0
        idLoginTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        idLoginTextField.layer.masksToBounds = true
        
        //        idLoginTextField.attributedPlaceholder = NSAttributedString(string:"Enter Title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.brownGrey])
        
        let loginIdAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.brownGrey,
            NSAttributedString.Key.font : UIFont(name: "NanumSquareR", size: 14)! // Note the !
        ]
        
        idLoginTextField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes:loginIdAttributes)
        
        
        pwLoginTextField.addLeftPadding()
        pwLoginTextField.layer.cornerRadius = 8.0
        pwLoginTextField.layer.borderWidth = 1.0
        pwLoginTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        pwLoginTextField.layer.masksToBounds = true
        pwLoginTextField.placeholder = "비밀번호"
        
        let loginPwAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.brownGrey,
            NSAttributedString.Key.font : UIFont(name: "NanumSquareR", size: 14)! // Note the !
        ]
        pwLoginTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes:loginPwAttributes)
        
    }
    
}

extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
