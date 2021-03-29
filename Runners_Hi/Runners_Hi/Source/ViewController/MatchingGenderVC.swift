//
//  MatchingGenderVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/09.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MatchingGenderVC: UIViewController {
    
    // MARK: Variable Part
    
    private var genderInformation: [Gender] = []
    
    var giveGenderText = 0 // 서버에게 넘겨줄 원하는 상대 러너의 성별
    
    // MARK: IBOutlet
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var genderCollectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: IBAction
    
    @IBAction func startButtonDidTap(_ sender: UIButton) {
        guard let StartButtonPush = self.storyboard?.instantiateViewController(identifier:"FindRunnerVC") as? FindRunnerVC else {return}
         self.navigationController?.pushViewController(StartButtonPush, animated: true)
        UserDefaults.standard.set(giveGenderText, forKey: "myWantGender")
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setText()
        setGenderList()
        // Do any additional setup after loading the vi0;ew.
    }
    

}

// MARK: Extension

extension MatchingGenderVC {
    
    // MARK: Function View Style
    
    func setView() {

        view.backgroundColor = UIColor.backgroundgray
        genderCollectionView.backgroundColor = UIColor.backgroundgray
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        startButton.isEnabled = false
        startButton.backgroundColor = UIColor.veryLightPink
        startButton.layer.cornerRadius = 8
        
        genderCollectionView.delegate = self
        genderCollectionView.dataSource = self
        
    }
    
    // MARK: Function Text Style
    
    func setText() {
        
        questionLabel.setLabel(text: "원하는 상대러너의 성별은?", color: .black, font: .nanumBold(size: 20))
        
        startButton.titleLabel?.font = .nanumBold(size: 16)
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitle("START", for: .normal)
    
    }
    
    
    // MARK: Function Table List Setting
    
    private func setGenderList() {
        
        let gender1 = Gender(genderActionLabelName: "남")
        let gender2 = Gender(genderActionLabelName: "여")
        let gender3 = Gender(genderActionLabelName: "상관없어요")
        
        genderInformation.append(contentsOf: [gender1,gender2,gender3])
    }
    
}

// MARK: UICollectionViewDataSource

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

// MARK: UICollectionViewDelegateFlowLayout

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
        if indexPath == [0, 0] {
            giveGenderText = 1
        } else if indexPath == [0, 1] {
            giveGenderText = 2
        } else {
            giveGenderText = 3
        }
        
    }
 
}
