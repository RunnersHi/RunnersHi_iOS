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
    
    var giveProfileFlag: Int = 0
    var giveGenderValue = 0
    var giveLevelValue = 0
    var giveOpenValue = false
    var giveOpenCheck = false
    var idCheckValue = false
    var nickCheckValue = false
    
    var cellGender: String = ""
    var cellLevel: String = ""
    var cellOpen: String = ""
    
    @IBOutlet weak var genderbuttonCollectionView: UICollectionView!
    @IBOutlet weak var levelbuttonCollectionView: UICollectionView!
    @IBOutlet weak var openbuttonCollectionView: UICollectionView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeButtonImage: UIImageView!
    @IBOutlet weak var profileChangeButton: UIButton!
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
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var openDetailLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwReTextField: UITextField!
    
    
    @IBOutlet weak var levelDetailButton: UIButton!
    @IBOutlet weak var idCheckButton: UIButton!
    @IBOutlet weak var nickCheckButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func idCheck(_ sender: Any) {
        guard let inputID = idTextField.text else {return}
        
        DuplicateService.shared.duplicate(check_name: inputID, flag: 1) { networkResult in switch networkResult {
        case .success(let success):
            guard let success = success as? Bool else {return}
            if success {
                self.idCheckLabel.text = "사용 가능한 아이디 입니다."
                self.idCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
                self.idCheckLabel.textColor = UIColor.lightishBlue
                self.idTextField.layer.cornerRadius = 8.0
                self.idTextField.layer.borderWidth = 1.0
                self.idTextField.layer.borderColor = UIColor.veryLightPink.cgColor
                self.idTextField.layer.masksToBounds = true
                self.idCheckValue = true
            }
            else {
                self.idCheckLabel.text = "중복된 아이디 입니다."
            }
            
        case .requestErr: print("")
        case .pathErr: print("path")
        case .serverErr: print("serverErr")
        case .networkFail: print("networkFail")
            
            }
        }
    }
    
    @IBAction func nickCheck(_ sender: Any) {
        guard let inputNick = nickTextField.text else {return}
        
        DuplicateService.shared.duplicate(check_name: inputNick, flag: 2) { networkResult in switch networkResult {
        case .success(let success):
            guard let success = success as? Bool else {return}
            if success {
                self.nickCheckLabel.text = "사용 가능한 아이디 입니다."
                self.nickCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
                self.nickCheckLabel.textColor = UIColor.lightishBlue
                self.nickTextField.layer.cornerRadius = 8.0
                self.nickTextField.layer.borderWidth = 1.0
                self.nickTextField.layer.borderColor = UIColor.veryLightPink.cgColor
                self.nickTextField.layer.masksToBounds = true
                self.nickCheckValue = true
            }
            else{
                self.nickCheckLabel.text = "중복된 아이디 입니다."
            }
            
        case .requestErr: print("")
        self.nickCheckLabel.text = "중복된 아이디 입니다."
        case .pathErr: print("path")
        case .serverErr: print("serverErr")
        case .networkFail: print("networkFail")
            
            }
        }
    }
    
    @IBAction func profileSelectPopUp(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Sign", bundle: nil)
          let popupVC = storyBoard.instantiateViewController(withIdentifier: "ProfilePopUpVC")
          popupVC.modalPresentationStyle = .overCurrentContext
          present(popupVC, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpActionButton(_ sender: Any) {
        let tabStoryBoard = UIStoryboard.init(name: "Tab", bundle: nil)
        
        guard let inputId = idTextField.text else { return }
        guard let inputPw = pwTextField.text else { return }
        guard let inputNick = nickTextField.text else { return }
        guard let inputGender: Int = giveGenderValue else { return }
        guard let inputLevel: Int = giveLevelValue else { return }
        guard let inputOpen: Bool = giveOpenValue else { return }
        guard let inputImgFlag: Int = giveProfileFlag else { return }
        
        SignUpService.shared.signup(id: inputId, password: inputPw, nickname: inputNick, gender: inputGender, level: inputLevel, log_visibility: inputOpen, image: inputImgFlag) { networkResult in switch networkResult {
        case .success(let success):
            guard let success = success as? Bool else {return}
            if success {
                guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInVC else { return }
                receiveViewController.afterRegisterId = inputId
                receiveViewController.afterRegisterPw = inputPw
                

                receiveViewController.modalPresentationStyle = .fullScreen
                self.present(receiveViewController, animated: true, completion: nil)
//                self.dismiss(animated: true, completion: nil)
//                self.show(receiveViewController, sender: self)
                //이동
                
//                guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
//                    "TabBarController") as? UITabBarController else { return }
//                tabbarController.modalPresentationStyle = .fullScreen
//                self.present(tabbarController, animated: true, completion: nil)
                
            }
            
        case .requestErr: print("requestErr")
        case .pathErr: print("path")
        case .serverErr: print("serverErr")
        case .networkFail: print("networkFail")
            
            }
        }
        

        
        
    }
    
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeProfileImageFlag(_:)), name: .sendPopUpFlag, object: nil)
    }
    
    @objc
    func changeProfileImageFlag(_ notification: NSNotification) {
        guard let flag = notification.userInfo?["flag"] as? Int else { return }
        giveProfileFlag = flag
        if (giveProfileFlag==1){
            profileImage.image=UIImage(named: "iconRedmanShorthair")
        }
        else if (giveProfileFlag == 2){
            profileImage.image=UIImage(named: "iconBluemanShorthair")
        }
        else if (giveProfileFlag == 3){
            profileImage.image=UIImage(named: "iconRedmanBasichair")
        }
        else if (giveProfileFlag == 4){
            profileImage.image=UIImage(named: "iconBluemanPermhair")
        }
        else if (giveProfileFlag == 5){
            profileImage.image=UIImage(named: "iconRedwomenPonytail")
        }
        else if (giveProfileFlag == 6){
            profileImage.image=UIImage(named: "iconBluewomenPonytail")
        }
        else if (giveProfileFlag == 7){
            profileImage.image=UIImage(named: "iconRedwomenShortmhair")
        }
        else if (giveProfileFlag == 8){
            profileImage.image=UIImage(named: "iconBluewomenPermhair")
        }
        else if (giveProfileFlag == 9){
            profileImage.image=UIImage(named: "iconRedwomenBunhair")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonList()
        addObserver()
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
        setTextField()
        loginCheck()
        
        setProfile()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
             self.view.endEditing(true)
       }
       
    override func  viewWillAppear(_ animated: Bool) {
        //guard let giveProfileFlag = self.giveProfileFlag else { return }
        print(self.giveProfileFlag)
        
    }
    
    
    
    
    private var genderList : [Gender] = []
    private var levelList : [Level] = []
    private var openList : [Open] = []
    
    func setButtonList() {
        let Gender1 = Gender(genderActionLabelName: "남성")
        let Gender2 = Gender(genderActionLabelName: "여성")
        
        let Level1 = Level(levelActionLabelName: "초급")
        let Level2 = Level(levelActionLabelName : "중급")
        let Level3 = Level(levelActionLabelName: "고급")
        
        let Open1 = Open(openActionLabelName : "공개")
        let Open2 = Open(openActionLabelName : "비공개")
        
        genderList = [Gender1, Gender2]
        levelList = [Level1, Level2, Level3]
        openList = [Open1, Open2]
    }
    
    func isValidId(id: String?) -> Bool {
        guard id != nil else { return false }
        //받아오는 id값이 비어있으면 안되겠쥬?
        let regEx = "[A-Za-z0-9]{4,15}"
        // 4~15자 영어,숫자 제한 정규표현식
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        //NSPredicate는 검색 조건을 텍스트로 입력하여 검색할 수 있게하는거라구 한다..SQL문이라
        // 너무 자세하게하면 어렵다구한다..
        // %@는 하나의 객체로 치환해주는 역할을 함.
        return pred.evaluate(with: id)
        // id 값이 pred의 값과 일치하는지 않하는지 여부를 판단해줌
        // 결과값이 true false로 나옴
    }
    
    func isValidNick(nick: String?) -> Bool {
        guard nick != nil else { return false }
        let regEx = "[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9]{2,6}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: nick)
    }
    
    func isValidPw(pw: String?) -> Bool {
        guard pw != nil else { return false }
        let regEx = "[A-Za-z0-9!_@$%^&+=]{8,16}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: pw)
        //_-^
    }
    
    
    @objc private func idTextChecked(_ TextLabel: UILabel) {
        
        if ( isValidId(id: idTextField.text)) {
            idCheckLabel.text = "중복확인이 필요합니다."
            idCheckLabel.alpha = 1
            idCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            idCheckLabel.textColor = UIColor.grapefruit
            idTextField.layer.borderColor = UIColor.grapefruit.cgColor
            idTextField.layer.borderWidth = 1
            idTextField.layer.masksToBounds = true
            idTextField.layer.cornerRadius = 8.0
            self.idCheckButton.isEnabled = true
        }
        else
        {
            idCheckLabel.text = "4-15자 영/숫자를 사용하세요."
            idCheckLabel.alpha = 1
            idCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            idCheckLabel.textColor = UIColor.grapefruit
            idTextField.layer.borderColor = UIColor.grapefruit.cgColor
            idTextField.layer.borderWidth = 1
            idTextField.layer.masksToBounds = true
            idTextField.layer.cornerRadius = 8.0
            self.idCheckButton.isEnabled = false
            if  giveProfileFlag==1{
                print("1")}
            else if giveProfileFlag==2{
                print("2")
            }
            else {
                print("왜 안넘어와")
            }
        }
    }
    
    @objc private func nickTextChecked(_ TextLabel: UILabel) {
        if ( isValidNick(nick: nickTextField.text)){
            nickCheckLabel.text = "중복확인이 필요합니다."
            nickCheckLabel.alpha = 1
            nickCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            nickTextField.layer.borderColor = UIColor.grapefruit.cgColor
            nickCheckLabel.textColor = UIColor.grapefruit
            nickTextField.layer.borderColor = UIColor.grapefruit.cgColor
            nickTextField.layer.borderWidth = 1
            nickTextField.layer.masksToBounds = true
            nickTextField.layer.cornerRadius = 8.0
            self.nickCheckButton.isEnabled = true
        }
        else
        {
            nickCheckLabel.text = "2-6자 한/영/숫자를 사용하세요."
            nickCheckLabel.alpha = 1
            nickCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            nickCheckLabel.textColor = UIColor.grapefruit
            nickTextField.layer.borderColor = UIColor.grapefruit.cgColor
            nickTextField.layer.borderWidth = 1
            nickTextField.layer.masksToBounds = true
            nickTextField.layer.cornerRadius = 8.0
            self.nickCheckButton.isEnabled = false
        }
    }
    
    @objc private func pwTextChecked(_ TextLabel: UILabel) {
        if ( isValidPw(pw: pwTextField.text)){
            pwCheckLabel.text = "사용가능한 비밀번호입니다."
            pwCheckLabel.alpha = 1
            pwCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            pwCheckLabel.textColor = UIColor.lightishBlue
            
            pwTextField.layer.borderColor = UIColor.veryLightPink.cgColor
            pwTextField.layer.borderWidth = 1
            pwTextField.layer.masksToBounds = true
            pwTextField.layer.cornerRadius = 8.0
            
            pwReTextField.isEnabled = true
            
        }
        else
        {
            pwCheckLabel.text = "8-16자 영문 대/소문자,숫자,특수문자를 사용하세요."
            pwCheckLabel.alpha = 1
            pwCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            pwCheckLabel.textColor = UIColor.grapefruit
            pwTextField.layer.borderColor = UIColor.grapefruit.cgColor
            pwTextField.layer.borderWidth = 1
            pwTextField.layer.masksToBounds = true
            pwTextField.layer.cornerRadius = 8.0
            pwReTextField.isEnabled = false
            
        }
    }
    
    @objc private func pwReTextChecked(_ TextLabel: UILabel) {
        if(pwTextField.text == pwReTextField.text) {
            pwReCheckLabel.text = "비밀번호가 일치합니다"
            pwReCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            pwReCheckLabel.textColor = UIColor.lightishBlue
            
            pwReTextField.layer.borderColor = UIColor.veryLightPink.cgColor
            pwReTextField.layer.borderWidth = 1
            pwReTextField.layer.masksToBounds = true
            pwReTextField.layer.cornerRadius = 8.0
        }
        else{
            pwReCheckLabel.text = "설정하신 비밀번호와 다릅니다"
            pwReCheckLabel.font = UIFont(name: "NanumSquareR", size: 12.0)
            pwReCheckLabel.textColor = UIColor.grapefruit
            pwReTextField.layer.borderColor = UIColor.grapefruit.cgColor
            pwReTextField.layer.borderWidth = 1
            pwReTextField.layer.masksToBounds = true
            pwReTextField.layer.cornerRadius = 8.0
        }
    }
    
}//class end



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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        signUpCondition()
        let cells = collectionView.cellForItem(at: indexPath) as? GenderSelectCell
        if cells?.genderActionLabel.text == "남성" {
            giveGenderValue = 1
            
        }
        else if cells?.genderActionLabel.text == "여성"{
            giveGenderValue = 2
            
        }
        
        
        let cells2 = collectionView.cellForItem(at: indexPath) as? LevelSelectCell
        if cells2?.levelActionLabel.text == "초급" {
            giveLevelValue = 1
            
            
        }
        else if cells2?.levelActionLabel.text == "중급" {
            giveLevelValue = 2
            
        }
        else if cells2?.levelActionLabel.text == "고급" {
            giveLevelValue = 3
            
        }
        
        let cells3 = collectionView.cellForItem(at: indexPath) as? OpenSelectCell
        if cells3?.openActionLabel.text == "공개" {
            giveOpenValue = true
            giveOpenCheck = true
            
        }
        else if cells3?.openActionLabel.text == "비공개"{
            giveOpenValue = false
            giveOpenCheck = true
            
            
        }
        signUpCondition()
        
        
    }
    
}

extension SignUpVC {
    private func setLabel() {
        self.idLabel.text = "아이디"
        idLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.idCheckLabel.text = " "
        idCheckLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        
        
        self.nickLabel.text = "닉네임"
        nickLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.nickCheckLabel.text = " "
        nickCheckLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        
        
        self.pwLabel.text = "비밀번호"
        pwLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.pwCheckLabel.text = " "
        pwCheckLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        
        
        self.pwReLabel.text = "비밀번호 확인"
        pwReLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.pwReCheckLabel.text = " "
        pwReCheckLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        
        
        self.genderLabel.text = "당신의 성별은?"
        genderLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        self.levelLabel.text = "본인이 생각하는 나의 러닝 레벨은?"
        levelLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        
        self.openLabel.text = "프로필 / 러닝 기록 설정"
        openLabel.font = UIFont(name:"NanumSquareR", size:14.0)
        
        
        self.openDetailLabel.text = "‘공개’를 선택해야 러너 랭킹 산정에 포함될 수 있어요."
        openDetailLabel.font = UIFont(name:"NanumSquareR", size:12.0)
        openDetailLabel.textColor = UIColor.brownGrey
        //label에 있는 Text를 NSMutableAttributedString으로 만들어준다.
        
    }
    private func setProfile() {
        
        profileImage.image=UIImage(named: "iconDefaultpeople")
        profileChangeButtonImage.image=UIImage(named:"iconPencil")
        profileChangeButton.setTitle("", for: .normal)
        
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
        self.signUpButton.backgroundColor = UIColor.brownishGrey
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:16)
        signUpButton.isEnabled = false
        
        
        
        let attributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.underlineStyle: 1,
        NSAttributedString.Key.font: UIFont(name: "NanumSquareR", size:12),
        NSAttributedString.Key.foregroundColor: UIColor.brownGrey
        ]

        let attributedString = NSMutableAttributedString(string: "러닝레벨이 무엇인가요?", attributes: attributes)
        levelDetailButton.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        
//        let titleString = NSMutableAttributedString(string: "러닝레벨이 무엇인가요?")
//        titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: "러닝레벨이 무엇인가요?" )
//        levelDetailButton.setAttributedTitle(titleString, for: .normal)
        
        
        //        let levelDetailLabelStyle = NSMutableAttributedString(string: levelDetailLabel.text!)
        //
        //        levelDetailLabelStyle.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (levelDetailLabel.text! as NSString).range(of:"러닝레벨이 무엇인가요?"))
        //
        //        levelDetailLabel.attributedText = levelDetailLabelStyle
        
    }
    
    private func setTextField() {
        idTextField.layer.cornerRadius = 8.0
        idTextField.layer.borderWidth = 1.0
        idTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        idTextField.layer.masksToBounds = true
        idTextField.addLeftPadding()
        
        nickTextField.layer.cornerRadius = 8.0
        nickTextField.layer.borderWidth = 1.0
        nickTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        nickTextField.layer.masksToBounds = true
        nickTextField.addLeftPadding()
        
        pwTextField.layer.cornerRadius = 8.0
        pwTextField.layer.borderWidth = 1.0
        pwTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        pwTextField.layer.masksToBounds = true
        pwTextField.isSecureTextEntry = true
        pwTextField.addLeftPadding()
        
        
        pwReTextField.layer.cornerRadius = 8.0
        pwReTextField.layer.borderWidth = 1.0
        pwReTextField.layer.borderColor = UIColor.veryLightPink.cgColor
        pwReTextField.layer.masksToBounds = true
        pwReTextField.isSecureTextEntry = true
        pwReTextField.addLeftPadding()
        
        
        
    }
    
    private func loginCheck() {
        idTextField.addTarget(self, action: #selector(idTextChecked(_:)), for: .editingChanged)
        nickTextField.addTarget(self, action: #selector(nickTextChecked(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextChecked(_:)), for: .editingChanged)
        pwReTextField.addTarget(self, action: #selector(pwReTextChecked(_:)), for: .editingChanged)
    }
    
    //    private func signUpCondition() {
    //        if (giveGenderCheck && giveLevelCheck && giveOpenCheck) {
    //                   self.signUpButton.backgroundColor = UIColor.lightishBlue
    //                    signUpButton.setTitleColor(.white, for: .normal)
    //                   signUpButton.isEnabled = true
    //
    //               }
    //               else {
    //                   self.signUpButton.backgroundColor = UIColor.brownishGrey
    //                   signUpButton.setTitleColor(.white, for: .normal)
    //                   signUpButton.isEnabled = false
    //               }
    //    }
    
    
    private func signUpCondition() {
        
        if (giveGenderValue != 0) && (giveLevelValue != 0) && (giveOpenCheck == true) && idCheckValue && nickCheckValue {
            
            print("회원가입 check2", "giveGenderValue",giveGenderValue,"giveLevelValue",giveLevelValue)
            signUpButton.isEnabled=true
            print("giveGenderValue",giveGenderValue, "giveLevelValue",giveLevelValue )
            self.signUpButton.backgroundColor = UIColor.lightishBlue
        }
            
        else{
            print("으악")
        }
    }
    
    private func receiveSignUpData() {
        // print("ddd",cellGender)
        
    }
    
    
}
