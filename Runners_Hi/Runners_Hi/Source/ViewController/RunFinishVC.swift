//
//  RunFinishVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/15.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RunFinishVC: UIViewController {

    
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var firstMentLabel: UILabel!
    @IBOutlet weak var secondMentLabel: UILabel!
    
    @IBOutlet weak var mainimage: UIImageView!
    
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
}
extension RunFinishVC {
    func setView() {
        finishLabel.text = "FINISH!"
        finishLabel.textAlignment = .center
        finishLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 52)
        finishLabel.textColor = UIColor.lightishBlue
        
        firstMentLabel.text = "재밌게 달리셨나요?"
        firstMentLabel.textAlignment = .center
        firstMentLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        secondMentLabel.text = "누가 더 많이 뛰었는지 비교 중이에요"
        secondMentLabel.font = UIFont(name: "NanumSquareB", size: 16)
        secondMentLabel.textAlignment = .center
        
       // mainimage.image = UIImage(named: <#T##String#>)
        
        goButton.setTitle("결과 보러가기", for: .normal)
        goButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:16)
        goButton.setTitleColor(.white, for: .normal)
        goButton.backgroundColor = UIColor.veryLightPink
        goButton.layer.cornerRadius = 8
        
    }
}
