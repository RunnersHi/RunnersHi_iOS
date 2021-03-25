//
//  MainVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/05.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: Variable Part
    
    static let identifier: String = "MainVC"
    
    var backBlackView = UIView()
    var battleInformation: [BattleInformation] = []
    
    // MARK: IBOutlet
    
    @IBOutlet weak var popUpTableView: UITableView!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var runButton: UIButton!
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var constraint_logo_ment: NSLayoutConstraint!
    @IBOutlet weak var constraint_ment_homeImg: NSLayoutConstraint!
    @IBOutlet weak var constarint_homeImg_button: NSLayoutConstraint!
    
    
    // MARK: IBAction
    
    @IBAction func runButtonDidTap(_ sender: Any) {
        // "RUN NOW" 버튼 클릭 시 Action -> 두 종류의 경쟁하기가 나와야함
        
        backBlackView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        // withAlphaComponent : alpha값이 있는 컬러로 지정
        backBlackView.frame = self.view.frame
        self.view.addSubview(backBlackView)
        // 뒤에 투명한 검은 배경을 깔아줌
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(downPopUpTableView))
        backBlackView.addGestureRecognizer(tapGesture)
        // blackView 클릭 시 Action 추가
        
        UIView.animate(withDuration: 0.3) {
            // animation 효과로 tableview의 이동을 자연스럽게 만듦
            
            self.popUpTableView.transform = .identity
            // .identity 로 밑으로 숨어있던 popUpTableView를 제자리로 위치시킴
        }
        
        self.view.bringSubviewToFront(popUpTableView)
        // black 뷰가 superView에 추가되었기 때문에 popUpTableView를 덮고있는데 그것을 앞으로 끌어내기위해 사용
        
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setbattleInformation()
        setText()
        setView()
    }
    
}

// MARK: Extension

extension MainVC {
    
    @objc func downPopUpTableView() {
        // BlackView 클릭 시의 Action
        
        UIView.animate(withDuration: 0.3) {
            // animation 효과로 tableview의 이동을 자연스럽게 만듦
            
            self.popUpTableView.transform = CGAffineTransform(translationX: 0, y: self.popUpTableView.frame.height)
            // popUpTableView의 높이만큼 밑으로 내려서 사용자 눈에 보이지 않게 만듦
            self.backBlackView.removeFromSuperview()
            // 뒤에 깔려있던 blackView를 화면에서 제거함
        }
    }
    
    func setbattleInformation() {
        // popUpTableView의 배열 설정
        
        let date1 = BattleInformation(ment: "다른 러너와 경쟁하기")
        let date2 = BattleInformation(ment: "나의 기록과 경쟁하기")
        
        battleInformation.append(contentsOf: [date1,date2])
    }
    
    // MARK: Function View Style
    
    func setView() {
        
        homeImageView.image = UIImage(named: "imgHomeactivityMain")
        logoImageView.image = UIImage(named: "homeLogo")
        
        self.view.backgroundColor = UIColor.backgroundgray
        
        insideView.backgroundColor = UIColor.white
        insideView.layer.cornerRadius = 20
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        if self.view.frame.height > 700 {
            // 화면에 길이에 따라 거리 조정 ( 화면 길이가 길면 늘려줌 )
            
            constraint_logo_ment.constant = 34
            constraint_ment_homeImg.constant = 59
            constarint_homeImg_button.constant = 51
        }
        
        popUpTableView.layer.cornerRadius = 20
        popUpTableView.transform = CGAffineTransform(translationX: 0, y: popUpTableView.frame.height)
        // popUpTableView 밑으로 숨긴 상태로 시작
        popUpTableView.delegate = self
        popUpTableView.dataSource = self
        
    }
    
    // MARK: Function Text Style
    
    private func setText() {
        
        runButton.backgroundColor = UIColor.lightishBlue
        runButton.setTitle("RUN NOW", for: .normal)
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = 12
        runButton.titleLabel?.font = .italicFont(size: 30)
        
        introLabel.numberOfLines = 0
        introLabel.setLabel(text: "상쾌한 오전,\n당신의 러닝상대를\n찾아 함께 뛰어보세요", color: .black, font: .nanumBold(size: 20))
        
        introLabel.lineSetting(lineSpacing: 7)
        
    }
}

// MARK: UITableViewDataSource

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battleInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let popUpCell = tableView.dequeueReusableCell(withIdentifier: PopUpCell.identifier, for: indexPath) as? PopUpCell else { return UITableViewCell() }
        popUpCell.setbattleInformation(ment: battleInformation[indexPath.row].ment)
        
        return popUpCell
    }
    
}

// MARK: UITableViewDelegate

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 셀 하나의 높이 값
        
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath == [0,0] {
            // 다른 러너와 경쟁하기로 이동
            
            guard let nextVC = self.storyboard?.instantiateViewController(identifier:"MatchingGoalVC") as? MatchingGoalVC else { return }
            nextVC.hidesBottomBarWhenPushed = true
            // 이동 시 탭바 숨기기
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        else {
            // 나의 기록과 경쟁하기로 이동

        }
    }
    
}
