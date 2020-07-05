//
//  TabBarVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/06.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setTabBar() {
        let runningTabStoryboard = UIStoryboard.init(name: "RunningTab", bundle: nil)
        
        guard let firstTab = runningTabStoryboard.instantiateViewController(identifier: "MainVC") as? MainVC else {
            return
        }

        
    }

}
