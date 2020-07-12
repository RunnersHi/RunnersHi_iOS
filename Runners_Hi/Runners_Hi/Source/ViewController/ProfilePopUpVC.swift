//
//  ProfilePopUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/12.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ProfilePopUpVC: UIViewController {
    
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
       }
    
    private func profileLayoutSet() {
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
