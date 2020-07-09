//
//  MatchingGenderVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/09.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MatchingGenderVC: UIViewController {

    private var genderInformation: [Gender] = []
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var genderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicAutoLayout()
        setGenderList()

        // Do any additional setup after loading the view.
    }
    
    private func basicAutoLayout() {
        questionLabel.text = "원하는 상대러너의 성별은?"
        questionLabel.font = UIFont(name: "NanumSquareB", size: 20)
        view.backgroundColor = UIColor.backgroundgray
    }
    private func setGenderList() {
        let gender1 = Gender(buttonName: "남")
        let gender2 = Gender(buttonName: "여")
        let gender3 = Gender(buttonName: "상관없어요")
        
        genderInformation = [gender1,gender2,gender3]
    }
  

}
