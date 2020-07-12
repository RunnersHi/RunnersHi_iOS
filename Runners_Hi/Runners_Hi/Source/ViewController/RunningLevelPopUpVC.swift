//
//  RunningLevelPopUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/12.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RunningLevelPopUpVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   

}

extension RunningLevelPopUpVC {
       private func viewset() {

        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .white
        label.text = "러닝을 가끔만 하는 /n 5분만 뛰어도 숨이 차는 러닝 경쟁 쉬엄쉬엄 하고 싶은"
        
       }
   }
