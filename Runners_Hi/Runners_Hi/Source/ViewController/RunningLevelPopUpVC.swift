//
//  RunningLevelPopUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/12.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RunningLevelPopUpVC: UIViewController {
    
    @IBOutlet weak var LevelPopView: UIView!
    @IBOutlet weak var runningLevName: UILabel!
    @IBOutlet weak var heojup: UILabel!
    @IBOutlet weak var lev1_1: UILabel!
    @IBOutlet weak var lev1_2: UILabel!
    @IBOutlet weak var lev1_3: UILabel!
    
    @IBOutlet weak var midlev: UILabel!
    @IBOutlet weak var lev2_1: UILabel!
    @IBOutlet weak var lev2_2: UILabel!
    @IBOutlet weak var lev2_3: UILabel!
    
    @IBOutlet weak var legeno: UILabel!
    @IBOutlet weak var lev3_1: UILabel!
    @IBOutlet weak var lev3_2: UILabel!
    @IBOutlet weak var lev3_3: UILabel!
    
    @IBOutlet weak var line1: UIImageView!
    @IBOutlet weak var line2: UIImageView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whatLevSet()
        viewset() 
    }
    
    
    
}

extension RunningLevelPopUpVC {
    
      private func viewset() {
            LevelPopView.layer.cornerRadius = 12
            LevelPopView.layer.masksToBounds = true
        }
    
    private func whatLevSet() {
        
        runningLevName.font = UIFont(name: "NanumSquareB", size: 18.0 )
        heojup.font = UIFont(name: "NanumSquareB", size: 18.0 )
        lev1_1.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev1_2.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev1_3.font = UIFont(name: "NanumSquareR", size: 14.0 )
        
        midlev.font = UIFont(name: "NanumSquareB", size: 18.0 )
        lev2_1.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev2_2.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev2_3.font = UIFont(name: "NanumSquareR", size: 14.0 )
        
        legeno.font = UIFont(name: "NanumSquareB", size: 18.0 )
        lev3_1.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev3_2.font = UIFont(name: "NanumSquareR", size: 14.0 )
        lev3_3.font = UIFont(name: "NanumSquareR", size: 14.0 )
        
        
        runningLevName.text = "러닝레벨이란?"
        heojup.text = "초급"
        lev1_1.text = "러닝을 가끔만 하는"
        lev1_2.text = "5분만 뛰어도 숨이 차는"
        lev1_3.text = "러닝 경쟁 쉬엄쉬엄 하고 싶은"
        
        midlev.text = "중급"
        lev2_1.text = "러닝을 꽤 해봤다 싶은"
        lev2_2.text = "10분 이상 뛰어도 괜찮은"
        lev2_3.text = "조금 잘하는 사람과 달리고 싶은"
        
        legeno.text = "고급"
        lev3_1.text = "러닝에 자신 있는"
        lev3_2.text = "20분 이상 뛰어도 괜찮은"
        lev3_3.text = "러닝 마니아끼리 달려보고 싶은"
        
        line1.image = UIImage(named: "graylineHomeactivity2")
        line2.image = UIImage(named: "graylineHomeactivity2")
        
        backBtn.setBackgroundImage(UIImage(named: "btnOff" ), for: .normal)
        backBtn.setTitle("", for: .normal)
        
        
    }
}
