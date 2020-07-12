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
    
    private var isToggle: Bool = false
    
    @IBAction func runButtonDidTap(_ sender: Any) {
        if isToggle {
            print("하")
            UIView.animate(withDuration: 0.3) {
                self.popUpTableView.transform = CGAffineTransform(translationX: 0, y: self.popUpTableView.frame.height-40)
            }
        } else {
            print("이")
            //hidesBottomBarWhenPushed = true
            //self.hidesBottomBarWhenPushed = true
            //self.tabBarController?.tabBar.layer.zPosition = -1
           // blackView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
           // blackView.frame = self.view.frame
            //blackView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
           // self.tabBarController?.tabBar.frame.height
           // self.view.frame.height
            //self.view.window?.addSubview(blackView)
           // self.view.addSubview(blackView)
            UIView.animate(withDuration: 0.3) {
                self.popUpTableView.transform = .identity
            //원래 자리로 돌아오기
            }
        }
        isToggle = isToggle ? false : true
    
    }
        
//    func onClickBlackView() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blackView))
//    }
        
    
    
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
