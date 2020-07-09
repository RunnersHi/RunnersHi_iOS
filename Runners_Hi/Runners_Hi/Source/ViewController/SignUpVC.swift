//
//  SignUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate, UICollectionViewDelegate {
    static let identifier: String = "SignUpVC"
    
    @IBOutlet weak var genderbuttonCollectionView: UICollectionView!
    @IBOutlet weak var levelbuttonCollectionView: UICollectionView!
    @IBOutlet weak var openbuttonCollectionView: UICollectionView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idCheckLabel: UILabel!
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var nickCheckLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var pwCheckLabel: UILabel!
    @IBOutlet weak var pwReLabel: UILabel!
    @IBOutlet weak var pwReCheckLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelDetailLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var openDetailLabel: UILabel!
    
    
    @IBOutlet weak var idCheckButton: UIButton!
    @IBOutlet weak var nickCheckButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonList()
        genderbuttonCollectionView.delegate = self
        genderbuttonCollectionView.dataSource = self
        self.genderbuttonCollectionView.isScrollEnabled = false
        
        levelbuttonCollectionView.delegate = self
        levelbuttonCollectionView.dataSource = self
        self.levelbuttonCollectionView.isScrollEnabled = false
        
        openbuttonCollectionView.delegate = self
        openbuttonCollectionView.dataSource = self
        self.openbuttonCollectionView.isScrollEnabled = false
        
        setLabel()
        setbutton()
    }
    
    
    private var genderList : [Gender] = []
    private var levelList : [Level] = []
    private var openList : [Open] = []
    
    func setButtonList() {
        let Gender1 = Gender(genderbuttonName: "남성")
        let Gender2 = Gender(genderbuttonName: "여성")
        
        let Level1 = Level(levelbuttonName: "초급")
        let Level2 = Level(levelbuttonName : "중급")
        let Level3 = Level(levelbuttonName: "고급")
        
        let Open1 = Open(openbuttonName : "공개")
        let Open2 = Open(openbuttonName : "비공개")
        
        genderList = [Gender1, Gender2]
        levelList = [Level1, Level2, Level3]
        openList = [Open1, Open2]
    }
}



extension SignUpVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return genderList.count
        if collectionView == genderbuttonCollectionView{
            return genderList.count}
        else if  collectionView == levelbuttonCollectionView{return levelList.count}
        else {
            return openList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == genderbuttonCollectionView{
            guard let GenderSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: GenderSelectCell.identifier, for: indexPath) as? GenderSelectCell else {return UICollectionViewCell() }
            GenderSelectCell.set(genderList[indexPath.row])
            return GenderSelectCell}
        else if collectionView == levelbuttonCollectionView{
            guard let LevelSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelSelectCell.identifier, for: indexPath) as? LevelSelectCell else {return UICollectionViewCell()}
            LevelSelectCell.set(levelList[indexPath.row])
            return LevelSelectCell}
        else{
            guard let OpenSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: OpenSelectCell.identifier, for: indexPath) as? OpenSelectCell else {return UICollectionViewCell()}
            OpenSelectCell.set(openList[indexPath.row])
            return OpenSelectCell
        }
    }
}

extension SignUpVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
        /*
         //        let screenRect = UIScreen.main.bounds
         //        let frameWidth = screenRect.size.width
         //        let frameHeight = screenRect.size.height
         
         //        return CGSize(width: 152, height: 48)
         */
        if collectionView == genderbuttonCollectionView {
            return CGSize(width: 152, height: 48)
        }
        else if collectionView == levelbuttonCollectionView {
            return CGSize(width : 97, height:48)
        }
        else {
            return CGSize(width: 152, height: 48)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == genderbuttonCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else if collectionView == levelbuttonCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == genderbuttonCollectionView {
            return 11
        }
        else if collectionView == levelbuttonCollectionView {
            return 12
        }
        else {
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == genderbuttonCollectionView {
            return 0
        }
        else if collectionView == levelbuttonCollectionView {
            return 0
        }
        else {
            return 0
        }
    }
    
    
}

extension SignUpVC {
    private func setLabel() {
        self.idLabel.text = "아이디"
        idLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.nickLabel.text = "닉네임"
        nickLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.pwLabel.text = "비밀번호"
        pwLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.pwReLabel.text = "비밀번호 확인"
        pwReLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.genderLabel.text = "당신의 성별은?"
        genderLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.levelLabel.text = "본인이 생각하는 나의 러닝 레벨은?"
        levelLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.levelDetailLabel.text = "러닝레벨이 무엇인가요?"
        levelDetailLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        levelDetailLabel.textColor = UIColor.brownGrey
        
        let levelDetailLabelStyle = NSMutableAttributedString(string: levelDetailLabel.text!)
        
        levelDetailLabelStyle.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (levelDetailLabel.text! as NSString).range(of:"러닝레벨이 무엇인가요?"))
        
        levelDetailLabel.attributedText = levelDetailLabelStyle
        
        
        self.openLabel.text = "프로필 / 러닝 기록 설정"
        openLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        
        self.openDetailLabel.text = "‘공개’를 선택해야 러너 랭킹 산정에 포함될 수 있어요."
        openDetailLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        openDetailLabel.textColor = UIColor.brownGrey
        //label에 있는 Text를 NSMutableAttributedString으로 만들어준다.
        let openDetailLabelStyle = NSMutableAttributedString(string: openDetailLabel.text!)
        
        openDetailLabelStyle.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (openDetailLabel.text! as NSString).range(of:"‘공개’를 선택해야 러너 랭킹 산정에 포함될 수 있어요."))
        
        openDetailLabel.attributedText = openDetailLabelStyle
    }
    
    private func setbutton() {
        idCheckButton.setTitle("중복확인", for: .normal)
        self.idCheckButton.layer.cornerRadius = 8
        self.idCheckButton.backgroundColor = UIColor.lightishBlue
        idCheckButton.setTitleColor(.white, for: .normal)
        idCheckButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:12)
        
        
        nickCheckButton.setTitle("중복확인", for: .normal)
        self.nickCheckButton.layer.cornerRadius = 8
        self.nickCheckButton.backgroundColor = UIColor.lightishBlue
        nickCheckButton.setTitleColor(.white, for: .normal)
        nickCheckButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:12)
        
        signUpButton.setTitle("가입하기", for: .normal)
        self.signUpButton.layer.cornerRadius = 8
        self.signUpButton.backgroundColor = UIColor.lightishBlue
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:16)
        
        
    }
    
//    private func setTextField(){
//        
//    }
}

