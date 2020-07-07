//
//  MainPopUpVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/07.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MainPopUpVC: UIViewController {
    static let identifier: String = "MainPopUpVC"
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func battleButtonDidTap(_ sender: Any) {
        authorizeHealthKit()
        
    }
    
    
    
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var selfBattleLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var firstEnterImage: UIImageView!
    @IBOutlet weak var secondEnterImage: UIImageView!
    @IBOutlet weak var battleButton: UIButton!
    @IBOutlet weak var selfBattleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        popBasicLayout()

        // Do any additional setup after loading the view.
    }
    

    func popBasicLayout() { 
        popUpView.layer.cornerRadius = 20
        battleLabel.text = "다른 러너와 경쟁하기"
        battleLabel.font = UIFont(name: "NanumSquareB", size: 20)
        selfBattleLabel.text = "나의 기록과 경쟁하기"
        selfBattleLabel.font = UIFont(name: "NanumSquareB", size: 20)
        firstEnterImage.image = UIImage(named: "iconEnter")
        secondEnterImage.image = UIImage(named: "iconEnter")
        battleButton.setTitle(nil, for: .normal)
        selfBattleButton.setTitle(nil, for: .normal)
    }
    
    private func authorizeHealthKit() {
      
      HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
        
        guard authorized else {
          
          let baseMessage = "HealthKit Authorization Failed"
          
          if let error = error {
            print("\(baseMessage). Reason: \(error.localizedDescription)")
          } else {
            print(baseMessage)
          }
          
          return
        }
        print("하이")
        print("HealthKit Successfully Authorized.")
        
      }
    }

}
