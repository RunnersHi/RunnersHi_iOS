//
//  RunnerProfileVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class OpponentProfileVC: UIViewController {

    // MARK: Variable Part
    
    var levelStruct = ["초급","중급","고급"]
    var profileImageStruct = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail","iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
    
    // MARK: IBOutlet
    
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
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setText()
        perform(#selector(sleepTime), with: nil, afterDelay: 3.0)
        // 3초 있다가 실행되는 함수
    }

}

// MARK: Extension

extension OpponentProfileVC {
    
    // MARK: Function Text Style
    
    func setText() {
        
        questionLabel.text = "당신과 함께 뛸 러너는?"
        questionLabel.font = .nanumBold(size: 20)
        
        levelLabel.text = "Lv."
        levelLabel.font = .nanumRegular(size: 14)
        
        scoreLabel.text = "전적"
        scoreLabel.font = .nanumRegular(size: 14)
        
        countLabel.text = "곧 카운트 다운이 시작됩니다"
        countLabel.font = .nanumBold(size: 16)
        
        let inputLevel = UserDefaults.standard.integer(forKey: "opponentLevel")
        let inputNick = UserDefaults.standard.string(forKey: "opponentNick")
        let inputWin = UserDefaults.standard.integer(forKey: "opponentWin")
        let inputLose = UserDefaults.standard.integer(forKey: "opponentLose")
        let inputImage = UserDefaults.standard.integer(forKey: "opponentImg")
        // 이전 뷰에서 저장해 둔 상대방 정보를 꺼내옴

        battleRunnerLevelLabel.text = levelStruct[(inputLevel)-1]
        battleRunnerLevelLabel.font = .nanumBold(size: 16)
        
        battleRunnerIDLabel.text = inputNick
        battleRunnerIDLabel.font = .nanumBold(size: 16)
        
        battleRunnerScoreLabel.text = "\(inputWin)승 \(inputLose)패"
        battleRunnerScoreLabel.font = .nanumBold(size: 16)
        
        battleRunnerImage.image = UIImage(named: profileImageStruct[(inputImage) - 1])
    }
    
    // MARK: Function View Style
    
    func setView() {
        
        view.backgroundColor = .backgroundgray
        levelView.backgroundColor = .backgroundgray
        scoreView.backgroundColor = .backgroundgray
        boxImage.image = UIImage(named: "whiteboxMatchsucactivityShadow")
    }
    
    @objc func sleepTime() {
        // 다음 뷰로 이동
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"CountdownVC") as? CountdownVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}
