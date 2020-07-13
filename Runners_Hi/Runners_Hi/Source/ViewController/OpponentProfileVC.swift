//
//  RunnerProfileVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class OpponentProfileVC: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var boxImage: UIImageView!
    @IBOutlet weak var battleRunnerImage: UIImageView! //상대 러너 프로필
    @IBOutlet weak var battleRunnerIDLabel: UILabel! // 상대 러너 아이디
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var battleRunnerLevelLabel: UILabel! // 상대 러너 레벨
    @IBOutlet weak var scoreLabel: UILabel! // 전적
    @IBOutlet weak var battleRunnerScoreLabel: UILabel! // 상대 러너 전적
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setLabel()
        perform(#selector(sleepTime), with: nil, afterDelay: 3.0)
        
    }

}

extension OpponentProfileVC {
    func setLabel() {
        
        questionLabel.text = "당신과 함께 뛸 러너는?"
        questionLabel.font = UIFont(name: "NanumSquareB", size: 20)
        
        levelLabel.text = "Lv."
        levelLabel.font = UIFont(name: "NanumSquare", size: 14)
        
        scoreLabel.text = "전적"
        scoreLabel.font = UIFont(name: "NanumSquare", size: 14)
        
        countLabel.text = "곧 카운트 다운이 시작됩니다"
        countLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        battleRunnerIDLabel.font = UIFont(name: "NanumSquareB", size: 16)
        battleRunnerLevelLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        let inputLevel = UserDefaults.standard.object(forKey: "opponentLevel") ?? 0
        let inputNick = UserDefaults.standard.object(forKey: "opponentNick") ?? " "
        let inputWin = UserDefaults.standard.object(forKey: "opponentWin") ?? 0
        let inputLose = UserDefaults.standard.object(forKey: "opponentLose") ?? 0
//
        if inputLevel as? Int == 1 {
            battleRunnerLevelLabel.text = "초급"
        } else if inputLevel as? Int == 2 {
            battleRunnerLevelLabel.text = "중급"
        } else {
            battleRunnerLevelLabel.text = "고급"
        }
        battleRunnerIDLabel.text = inputNick as? String
        battleRunnerScoreLabel.text = "\(inputWin as? Int ?? 0)승 \(inputLose as? Int ?? 0)패"
//        
        battleRunnerScoreLabel.font = UIFont(name: "NanumSquareB", size: 16)
    }
    
    func setView() {
        
        view.backgroundColor = UIColor.backgroundgray
        levelView.backgroundColor = UIColor.backgroundgray
        scoreView.backgroundColor = UIColor.backgroundgray
        boxImage.image = UIImage(named: "whiteboxMatchsucactivityShadow")
        
    }
    @objc func sleepTime() {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier:"CountdownVC") as? CountdownVC else {return}
        self.navigationController?.pushViewController(receiveViewController, animated: true)
    }
}
