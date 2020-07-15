//
//  MainVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/05.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    static let identifier: String = "MainVC"
    var blackView = UIView()
    
    
    @IBOutlet weak var popUpTableView: UITableView!
    @IBOutlet weak var mentLabel1: UILabel!
    @IBOutlet weak var mentLabel2: UILabel!
    @IBOutlet weak var mentLabel3: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var runButton: UIButton!
    
    @IBOutlet weak var homeImg: UIImageView!
    
    
    @IBOutlet weak var constraint_logo_ment: NSLayoutConstraint!
    
    @IBOutlet weak var constraint_ment_homeImg: NSLayoutConstraint!
    @IBOutlet weak var constarint_homeImg_button: NSLayoutConstraint!
    // private var isToggle: Bool = false
    
    @IBAction func runButtonDidTap(_ sender: Any) {
        blackView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blackView.frame = self.view.frame
        self.view.addSubview(blackView)
        //self.view.bringSubviewToFront(blackView)
        UIView.animate(withDuration: 0.3) {
            self.popUpTableView.transform = .identity
            self.onClickBlackView()
        }

       self.view.bringSubviewToFront(popUpTableView)
    
    }
    
    func onClickBlackView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onGesture))

        blackView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onGesture() {
        UIView.animate(withDuration: 0.3) {
            self.popUpTableView.transform = CGAffineTransform(translationX: 0, y: self.popUpTableView.frame.height)
            //self.setTabBarVisible(visible: true, animated: true)
            self.blackView.removeFromSuperview()
        }
    }
        
    
    
    private var battleInformation: [BattleInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicAutoLayout()
        setbattleInformation()
        
        popUpTableView.transform = CGAffineTransform(translationX: 0, y: popUpTableView.frame.height)
    }
    private func setbattleInformation() {
        let date1 = BattleInformation(ment: "다른 러너와 경쟁하기")
        let date2 = BattleInformation(ment: "나의 기록과 경쟁하기")
        
        battleInformation = [date1,date2]
    }
    
    private func basicAutoLayout() {
        
        homeImg.image = UIImage(named: "imgHomeactivityMain")
        logoImg.image = UIImage(named: "homeLogo")
        self.view.backgroundColor = UIColor.backgroundgray
        secondView.backgroundColor = UIColor.white
        secondView.layer.cornerRadius = 20
        runButton.backgroundColor = UIColor.lightishBlue
        runButton.setTitle("RUN NOW", for: .normal)
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = 12
        mentLabel1.font = UIFont(name: "NanumSquareB", size: 20)
        mentLabel2.font = UIFont(name: "NanumSquareB", size: 20)
        mentLabel3.font = UIFont(name: "NanumSquareB", size: 20)
        runButton.titleLabel?.font = UIFont(name: "AvenirNext-BoldItalic", size: 30)
        popUpTableView.layer.cornerRadius = 20
        //self.tabBarController?.tabBar.isHidden = false
        
        //self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
       //구분선 제거
        //popUpTableView.separatorStyle = .none
        popUpTableView.delegate = self
        popUpTableView.dataSource = self
        
        if self.view.frame.height > 700 {
            constraint_logo_ment.constant = 34
            constraint_ment_homeImg.constant = 59
            constarint_homeImg_button.constant = 51
            
        }
    }
    private func authorizeHealthKit() {
      
      HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
        
        guard authorized else {
          
          let baseMessage = "HealthKit Authorization Failed"
          
          if let error = error {
            print("\(baseMessage). Reason: \(error.localizedDescription)")
          } else {
            print(baseMessage)
          }
          
          return
        }
        print("HealthKit Successfully Authorized.")
        
      }
    }
    @objc func handleDismiss() {
        popUpTableView.isHidden = true
    }
    

}

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
extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0,0] {
            authorizeHealthKit()
            guard let PopUpPush = self.storyboard?.instantiateViewController(identifier:"MatchingGoalVC") as? MatchingGoalVC else {return}
            PopUpPush.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(PopUpPush, animated: true)
        } else {
            authorizeHealthKit()
        }
    }
    
}
