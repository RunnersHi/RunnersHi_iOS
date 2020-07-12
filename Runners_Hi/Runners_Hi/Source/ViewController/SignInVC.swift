//
//  SignInVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    var afterRegisterId: String?
    var afterRegisterPw: String?
    
    @IBOutlet weak var loginLogo: UIImageView!
    @IBOutlet weak var idLoginTextField: UITextField!
    @IBOutlet weak var pwLoginTextField: UITextField!
    @IBOutlet weak var loginCheckLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var findLabel: UILabel!
    @IBAction func loginActionButton(_ sender: Any) {
        
        guard let inputID = idLoginTextField.text else { return }
        guard let inputPWD = pwLoginTextField.text else { return }
        let tabStoryBoard = UIStoryboard.init(name: "Tab", bundle: nil)
        
        LoginService.shared.login(id: inputID, password: inputPWD) { networkResult in switch networkResult {
        case .success(let token):
            guard let token = token as? String else { return }
            UserDefaults.standard.set(token, forKey: "token")
            
            //서버에서 로그인 실패시에, token을 아예 안보내는데, 이 토큰의 존재여부로 조건 달아줘야할 것 같은데. 그런 함수가 있나..?
            if token != ""{
                guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                    "TabBarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            }
            else {
                
                self.idLoginTextField.layer.cornerRadius = 8.0
                self.idLoginTextField.layer.borderWidth = 1.0
                self.idLoginTextField.layer.borderColor = UIColor.grapefruit.cgColor
                self.idLoginTextField.layer.masksToBounds = true
                
                self.pwLoginTextField.layer.cornerRadius = 8.0
                self.pwLoginTextField.layer.borderWidth = 1.0
                self.pwLoginTextField.layer.borderColor = UIColor.grapefruit.cgColor
                self.pwLoginTextField.layer.masksToBounds = true
                
                self.loginCheckLabel.text = "아이디 혹은 비밀번호가 일치하지 않습니다."
            }
            
        case .requestErr: print("requestErr")
        
        self.idLoginTextField.layer.cornerRadius = 8.0
        self.idLoginTextField.layer.borderWidth = 1.0
        self.idLoginTextField.layer.borderColor = UIColor.grapefruit.cgColor
        self.idLoginTextField.layer.masksToBounds = true
        
        self.pwLoginTextField.layer.cornerRadius = 8.0
        self.pwLoginTextField.layer.borderWidth = 1.0
        self.pwLoginTextField.layer.borderColor = UIColor.grapefruit.cgColor
        self.pwLoginTextField.layer.masksToBounds = true
        
        self.loginCheckLabel.text = "아이디 혹은 비밀번호가 일치하지 않습니다."
            
            
        case .pathErr: print("path")
        case .serverErr: print("serverErr")
        case .networkFail: print("networkFail")
            
            
            }
        }
    }
    
    @IBAction func SignUpActionButton(_ sender: Any) {
        
        guard let SignUpButtonPush = self.storyboard?.instantiateViewController(identifier:"SignUpVC") as? SignUpVC else {return}
        SignUpButtonPush.modalPresentationStyle = .fullScreen
        self.present(SignUpButtonPush, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextFieldSet()
        loginLayoutset()
        
        loginActionButton(autoLogin())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
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
            NSAttributedString.Key.font : UIFont(name: "NanumSquareR", size: 14)!
        ]
        
        idLoginTextField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes:loginIdAttributes)
        
        
        pwLoginTextField.addLeftPadding()
        pwLoginTextField.layer.cornerRadius = 8.0
        pwLoginTextField.layer.borderWidth = 1.0
        pwLoginTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        pwLoginTextField.layer.masksToBounds = true
        pwLoginTextField.placeholder = "비밀번호"
        pwLoginTextField.isSecureTextEntry = true
        
        
        let loginPwAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.brownGrey,
            NSAttributedString.Key.font : UIFont(name: "NanumSquareR", size: 14)! // Note the !
        ]
        pwLoginTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes:loginPwAttributes)
    }
    
    private func loginLayoutset(){
        loginLogo.image=UIImage(named: "loginLogo")
        
        loginButton.setTitle("로그인", for: .normal)
        self.loginButton.layer.cornerRadius = 8
        self.loginButton.backgroundColor = UIColor.lightishBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:16)
        
        
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "NanumSquareR", size:12)
        
        
        self.findLabel.text = "아이디/비밀번호 찾기"
        findLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        
        self.loginCheckLabel.text = " "
        loginCheckLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        loginCheckLabel.textColor = UIColor.grapefruit
        
    }
    
    private func autoLogin() {
        guard let afterRegisterId = self.afterRegisterId else { return }
        guard let afterRegisterPw = self.afterRegisterPw else { return }
        
        idLoginTextField.text = afterRegisterId
        pwLoginTextField.text = afterRegisterPw
    }
    
}

extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}


