//
//  TabBarVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/06.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()

        // Do any additional setup after loading the view.
    }
    

    func setTabBar() {
        
        //첫번째탭
        let runningTabStoryboard = UIStoryboard.init(name: "RunningTab", bundle: nil)
        
        guard let firstTab = runningTabStoryboard.instantiateViewController(identifier: "MainNC") as? MainNavigationController else {
            return
        }
        firstTab.tabBarItem.title = nil
        firstTab.tabBarItem.image = UIImage(named: "icon8HomeUnsel")?.withRenderingMode(.alwaysOriginal)
        firstTab.tabBarItem.selectedImage = UIImage(named: "icon8HomeSel")?.withRenderingMode(.alwaysOriginal)
        
        //두번째탭
        let recordTabStoryboard = UIStoryboard.init(name: "RecordTab", bundle: nil)
        
        guard let secondTab = recordTabStoryboard.instantiateViewController(identifier: "RecordTabChildVC1") as? RecordTabChildVC1 else {
            return
        }
        secondTab.tabBarItem.image = UIImage(named: "icon8RecordUnsel")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "icon8RecordSel")?.withRenderingMode(.alwaysOriginal)
        
        //세번째탭
        let rankTabStoryboard = UIStoryboard.init(name: "RankingTab", bundle: nil)
        
        guard let thirdTab = rankTabStoryboard.instantiateViewController(identifier: "RankVC") as? RankVC else {
            return
        }
        
        thirdTab.tabBarItem.image = UIImage(named: "icon8RankingUnsel")?.withRenderingMode(.alwaysOriginal)
        thirdTab.tabBarItem.selectedImage = UIImage(named: "icon8RankingSel")?.withRenderingMode(.alwaysOriginal)
        
        //네번째 탭
        let mypageTabStoryboard = UIStoryboard.init(name: "MyPageTab", bundle: nil)
        
        guard let fourthTab = mypageTabStoryboard.instantiateViewController(identifier: "MyPageVC") as? MyPageVC else {
            return
        }
        
        fourthTab.tabBarItem.image = UIImage(named: "icon8ProfileUnsel")?.withRenderingMode(.alwaysOriginal)
        fourthTab.tabBarItem.selectedImage = UIImage(named: "icon8ProfileSel")?.withRenderingMode(.alwaysOriginal)
        
        let tabs = [firstTab,secondTab,thirdTab,fourthTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab
        
        //var tabFrame = self.tabBar.frame
        //tabFrame.size.height = 50
        //self.tabBar.frame = tabFrame
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = .lightGray
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowOpacity = 0.1
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        
        
    }

}
