//
//  RankTabParentViewController.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class RecordTabParentVC: ButtonBarPagerTabStripViewController {
    let purpleInspireColor = UIColor(red:0, green:0, blue:0, alpha:1.0)
    
    override func viewDidLoad() {
  

        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = UIFont(name:"NanumSquareB", size:16.0)!
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarItemLeftRightMargin = 0
        settings.style.buttonBarMinimumLineSpacing = 10
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
        guard changeCurrentIndex == true else { return }
        oldCell?.label.textColor = .veryLightPink
        newCell?.label.textColor = self?.purpleInspireColor
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let recordChild_1 = UIStoryboard(name: "RecordTab", bundle: nil).instantiateViewController(withIdentifier: "RecordTabChildVC1")
    let recordChild_2 = UIStoryboard(name: "RecordTab", bundle: nil).instantiateViewController(withIdentifier: "RecordTabChildVC2")
    return [recordChild_1, recordChild_2]
    }

}
