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
    @IBOutlet weak var battleRunnerImage: UIImageView!
    @IBOutlet weak var battleRunnerIDLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var battleRunnerLevelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var battleRunnerScoreLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        basicAutoLayout()
        // Do any additional setup after loading the view.
    }
    private func basicAutoLayout() {
        view.backgroundColor = UIColor.backgroundgray
        questionLabel.text = "당신과 함께 뛸 러너는?"
        questionLabel.font = UIFont(name: "NanumSquareB", size: 20)
        boxImage.image = UIImage(named: "whiteboxMatchsucactivityShadow")
        levelView.backgroundColor = UIColor.backgroundgray
        scoreView.backgroundColor = UIColor.backgroundgray
        levelLabel.text = "Lv."
        levelLabel.font = UIFont(name: "NanumSquare", size: 14)
        battleRunnerLevelLabel.font = UIFont(name: "NanumSquareB", size: 16)
        scoreLabel.text = "전적"
        scoreLabel.font = UIFont(name: "NanumSquare", size: 14)
        battleRunnerScoreLabel.font = UIFont(name: "NanumSquareB", size: 16)
        countLabel.text = "곧 카운트 다운이 시작됩니다"
        countLabel.font = UIFont(name: "NanumSquareB", size: 16)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
