//
//  RecordTabChildVC2.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class RecordTabChildVC2: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
           return IndicatorInfo(title: "러닝뱃지")
       }

}
