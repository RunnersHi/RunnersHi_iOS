//
//  ProfilePopUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/12.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let sendPopUpFlag = NSNotification.Name("sendPopUpFlag")
}

class ProfilePopUpVC: UIViewController {
    
    var popUpProfileFlag: Int = 0
    

    @IBOutlet var PopUpView: UIView!
    @IBOutlet weak var profilePopUpLabel: UILabel!
    @IBOutlet weak var popUpBackButton: UIButton!
    @IBOutlet weak var profile1: UIButton!
    @IBOutlet weak var profile2: UIButton!
    @IBOutlet weak var profile3: UIButton!
    @IBOutlet weak var profile4: UIButton!
    @IBOutlet weak var profile5: UIButton!
    @IBOutlet weak var profile6: UIButton!
    @IBOutlet weak var profile7: UIButton!
    @IBOutlet weak var profile8: UIButton!
    @IBOutlet weak var profile9: UIButton!
    @IBOutlet weak var profileChoiceView: UIView!
    
    @IBAction func profile1Action(_ sender: Any) {
        popUpProfileFlag = 1
        print(popUpProfileFlag)
    }
    @IBAction func profile2Action(_ sender: Any) {
        popUpProfileFlag = 2
         print(popUpProfileFlag)
    }
    @IBAction func profile3Action(_ sender: Any) {
        popUpProfileFlag = 3
    }
    @IBAction func profile4Action(_ sender: Any) {
        popUpProfileFlag = 4
    }
    @IBAction func profile5Action(_ sender: Any) {
        popUpProfileFlag = 5
        
    }
    @IBAction func profile6Action(_ sender: Any) {
        popUpProfileFlag = 6
        
    }
    @IBAction func profile7Action(_ sender: Any) {
        popUpProfileFlag = 7
        
    }
    @IBAction func profile8Action(_ sender: Any) {
        popUpProfileFlag = 8
        
    }
    @IBAction func profile9Action(_ sender: Any) {
        popUpProfileFlag = 9
    }
    @IBAction func PopUpBack(_ sender: Any) {
        NotificationCenter.default.post(name: .sendPopUpFlag, object: nil, userInfo: ["flag": popUpProfileFlag])
        //receiveViewController.giveProfileFlag = popUpProfileFlag
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewset()
        profileLayoutSet()
    }
    
}



extension ProfilePopUpVC {
    
    private func viewset() {
        profileChoiceView.layer.cornerRadius = 12
        profileChoiceView.layer.masksToBounds = true
        
//        PopUpView.backgroundColor = UIColor.black.withAlphaComponent(0)
//        PopUpView.isOpaque = false
    }
    
    private func profileLayoutSet() {
        self.view.backgroundColor = .white

        profilePopUpLabel.text = "프로필을 선택해 주세요"
        profilePopUpLabel.font = UIFont(name:"NanumSquareB", size:18.0)
        
        popUpBackButton.setBackgroundImage(UIImage(named: "btnOff" ), for: .normal)
        popUpBackButton.setTitle("", for: .normal)
        
        
        profile1.setBackgroundImage(UIImage(named:"iconRedmanShorthair"), for: .normal)
        profile1.setTitle("", for: .normal)
        
        profile2.setBackgroundImage(UIImage(named:"iconBluemanShorthair"), for: .normal)
        profile2.setTitle("", for: .normal)
        
        profile3.setBackgroundImage(UIImage(named:"iconRedmanBasichair"), for: .normal)
        profile3.setTitle("", for: .normal)
        
        profile4.setBackgroundImage(UIImage(named:"iconBluemanPermhair"), for: .normal)
        profile4.setTitle("", for: .normal)
        
        profile5.setBackgroundImage(UIImage(named:"iconRedwomenPonytail"), for: .normal)
        profile5.setTitle("", for: .normal)
        
        profile6.setBackgroundImage(UIImage(named:"iconBluewomenPonytail"), for: .normal)
        profile6.setTitle("", for: .normal)
        
        profile7.setBackgroundImage(UIImage(named:"iconRedwomenShortmhair"), for: .normal)
        profile7.setTitle("", for: .normal)
        
        profile8.setBackgroundImage(UIImage(named:"iconBluewomenPermhair"), for: .normal)
        profile8.setTitle("", for: .normal)
        
        profile9.setBackgroundImage(UIImage(named:"iconRedwomenBunhair"), for: .normal)
        profile9.setTitle("", for: .normal)
    }
    
}
