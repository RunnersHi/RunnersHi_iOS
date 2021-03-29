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
    var nextButton = UIButton()
    
    // MARK: IBOutlet
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var goalCollectionView: UICollectionView!
    
    // MARK: IBAction
    
    @objc func nextButtonDidTap(_ sender: UIButton) {
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
        makeNextButton()
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
    
    func makeNextButton() {
        // code로 Next Button 구현하기
        
        self.view.addSubview(nextButton)
        // 뷰에 button을 추가함
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        // 레이아웃을 수동으로 주고싶을 때 호출하는 인스턴스
        // true 일 때는 자동으로 레이아웃을 주는데 false로 지정하면서 내가 원하는대로 레이아웃을 줄 수 있게 함
        
        nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // nextButton의 Horizontally in Container과 같은 효과를 준다 (가운데 정렬)
        
        nextButton.widthAnchor.constraint(equalToConstant: 275).isActive = true
        // width 조절 ( 여기서는 고정값을 줌 )
        /*
         만약 길이를 고정값이 아닌 비율로 주고싶다면?
         nextButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 275/375).isActive = true
         버튼의 길이 = 뷰의 길이 * 275/375 를 이렇게 코드로 나타낼 수 있다
         */
    
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        // height 조절
        /*
         만약 높이를 길이에 대한 비율로 주고싶다면?
         nextButton.heightAnchor.constraint(equalTo: nextButton.widthAnchor, multiplier: 48/275).isActive = true
         버튼의 높이 = 버튼의 길이 * 48/275 를 이렇게 코드로 나타낼 수 있다
         */
        
        nextButton.topAnchor.constraint(equalTo: self.goalCollectionView.bottomAnchor, constant: 97).isActive = true
        // CollectionView로 부터 97만큼 밑에 존재하게 값을 줌
        /*
         만약 바닥에서부터 떨어져있는 값을 주고싶다면?
         nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -86).isActive = true
         로 뷰의 바닥에서부터 86만큼 위에 존재한다는 것을 이렇게 코드로 나타낼 수 있다
         */
        
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        // nextButton을 클릭했을 때 원하는 Action을 연결시켜줌
        
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
