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
    
    var giveGoal = "" //앞에서 받아온 목표 시간
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var genderCollectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicAutoLayout()
        setGenderList()
        // Do any additional setup after loading the view.
    }
    
    
    private func basicAutoLayout() {
        genderCollectionView.delegate = self
        genderCollectionView.dataSource = self
        startButton.isEnabled = false
        questionLabel.text = "원하는 상대러너의 성별은?"
        questionLabel.font = UIFont(name: "NanumSquareB", size: 20)
        view.backgroundColor = UIColor.backgroundgray
        genderCollectionView.backgroundColor = UIColor.backgroundgray
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
        startButton.backgroundColor = UIColor.unselectedbuttongray
        startButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitle("START", for: .normal)
    }
    private func setGenderList() {
        let gender1 = Gender(buttonName: "남")
        let gender2 = Gender(buttonName: "여")
        let gender3 = Gender(buttonName: "상관없어요")
        
        genderInformation = [gender1,gender2,gender3]
    }

}
extension MatchingGenderVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genderInformation.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let GenderSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: BattleGenderSelectCell.identifier, for: indexPath) as? BattleGenderSelectCell else {return UICollectionViewCell() }
        GenderSelectCell.setGenderInformation(genderInformation[indexPath.row])
        
        return GenderSelectCell
    }
}

extension MatchingGenderVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 275, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 50
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        startButton.isEnabled = true
        startButton.backgroundColor = UIColor.lightishBlue
        startButton.setTitleColor(.white, for: .normal)
    }
    
    
}
