//
//  MatchingGoalVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit


class MatchingGoalVC: UIViewController {
    private var goalInformation: [GoalInformation] = []

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var goalCollectionView: UICollectionView!
        
    @IBOutlet weak var nextButton: UIButton!
    var giveGoalText = 0
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        guard let NextButtonPush = self.storyboard?.instantiateViewController(identifier:"MatchingGenderVC") as? MatchingGenderVC else {return}
        self.navigationController?.pushViewController(NextButtonPush, animated: true)
        UserDefaults.standard.set(giveGoalText, forKey: "myGoalTime")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        basicAutoLayout()
        setGoalList()
    }
    

    private func basicAutoLayout() {
        goalCollectionView.delegate = self
        goalCollectionView.dataSource = self
        nextButton.isEnabled = false
        questionLabel.text = "오늘의 러닝 목표시간은?"
        questionLabel.font = UIFont(name: "NanumSquareB", size: 20)
        view.backgroundColor = UIColor.backgroundgray
        goalCollectionView.backgroundColor = UIColor.backgroundgray
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
        nextButton.backgroundColor = UIColor.veryLightPink
        nextButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("NEXT",for: .normal)
        nextButton.layer.cornerRadius = 8
   
    }
    private func setGoalList() {
        let goal1 = GoalInformation(goal: "30min")
        let goal2 = GoalInformation(goal: "45min")
        let goal3 = GoalInformation(goal: "1hour")
        let goal4 = GoalInformation(goal: "1h 30min")
        let goal5 = GoalInformation(goal: "30sec")
        goalInformation = [goal1,goal2,goal3,goal4,goal5]
        
    }

}
extension MatchingGoalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goalInformation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let GoalSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: BattleGoalSelectCell.identifier, for: indexPath) as? BattleGoalSelectCell else { return UICollectionViewCell() }
        GoalSelectCell.setGoalInformation(goalInformation[indexPath.row])
        
        return GoalSelectCell
    }
    

}
extension MatchingGoalVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: collectionView.frame.width * 275/375, height: view.frame.height * 48/667)
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
        nextButton.isEnabled = true
        nextButton.backgroundColor = UIColor.lightishBlue
        nextButton.setTitleColor(.white, for: .normal)
        if indexPath == [0, 0] {
            //분 단위로 전달
            giveGoalText = 1800
        } else if indexPath == [0, 1] {
            giveGoalText = 2700
        } else if indexPath == [0, 2] {
            giveGoalText = 3600
        } else if indexPath == [0, 3]{
            giveGoalText = 5400
        } else {
            giveGoalText = 30
        }
    }

    
}
