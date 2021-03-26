//
//  MatchingGoalVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit


class MatchingGoalVC: UIViewController {
    
    // MARK: Variable Part
    
    private var goalInformation: [GoalInformation] = []
    var userGoalTime = 0
    // 유저가 러닝하기 원하는 시간
    
    // MARK: IBOutlet
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var goalCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: IBAction
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        // "NEXT" 버튼 클릭 시 Action -> 성별 선택하는 뷰가 나와야함
        
        guard let NextButtonPush = self.storyboard?.instantiateViewController(identifier:"MatchingGenderVC") as? MatchingGenderVC else { return }
        
        self.navigationController?.pushViewController(NextButtonPush, animated: true)
        
        UserDefaults.standard.set(userGoalTime, forKey: "myGoalTime")
        // 유저의 목표 시간을 저장해둠
        
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setText()
        setGoalList()
    }
    
    
}

// MARK: Extension

extension MatchingGoalVC {
    
    // MARK: Function View Style
    
    func setView() {
        
        view.backgroundColor = UIColor.backgroundgray
        goalCollectionView.backgroundColor = UIColor.backgroundgray
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.backgroundColor = UIColor.veryLightPink
        nextButton.layer.cornerRadius = 8
        nextButton.isEnabled = false
        // 목표 시간을 설정하기 전에는 다음 버튼을 누를 수 없게 설정
        
        goalCollectionView.delegate = self
        goalCollectionView.dataSource = self
        
    }
    
    // MARK: Function Text Style
    
    func setText() {
        
        questionLabel.setLabel(text: "오늘의 러닝 목표시간은?", color: .black, font: .nanumBold(size: 20))
        
        nextButton.titleLabel?.font = .nanumBold(size: 16)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        
    }
    
    // MARK: Function Table List Setting
    
    func setGoalList() {

        let goal1 = GoalInformation(goal: "30min", time: 1800)
        let goal2 = GoalInformation(goal: "45min", time: 2700)
        let goal3 = GoalInformation(goal: "1hour", time: 3600)
        let goal4 = GoalInformation(goal: "1h 30min", time: 5400)
        
        goalInformation.append(contentsOf: [goal1,goal2,goal3,goal4])

        
    }
}

// MARK: UICollectionViewDataSource

extension MatchingGoalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return goalInformation.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let GoalSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: BattleGoalSelectCell.identifier, for: indexPath) as? BattleGoalSelectCell else { return UICollectionViewCell()

        }
        
        GoalSelectCell.setGoalInformation(goalInformation[indexPath.row])
        
        return GoalSelectCell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension MatchingGoalVC: UICollectionViewDelegateFlowLayout {
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
        // 셀 클릭 시 Action
        
        nextButton.isEnabled = true
        // 다음 뷰로 넘어갈 수 있게 button 활성화
        
        nextButton.backgroundColor = UIColor.lightishBlue
        nextButton.setTitleColor(.white, for: .normal)
        
        userGoalTime = goalInformation[indexPath.row].time
        // 목표 시간 설정
        
    }
    
    
}
