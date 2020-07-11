///
//  RunActivityVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/11.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RunActivityVC: UIViewController {

    
    
    @IBOutlet weak var backBoxImage: UIImageView!
    
    @IBOutlet weak var opponentImage: UIImageView!
    @IBOutlet weak var opponentNickLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var opponentLevelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var finishTimeLabel: NSLayoutConstraint!
    
    @IBOutlet weak var runProgressBar: UIProgressView!
    
    @IBOutlet weak var paceView: UIView!
    
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var opponentKmLabel: UILabel!
    
    
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var opponentLeftTimeLabel: UILabel!
    
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var opponentPaceLabel: UILabel!
    
    @IBOutlet weak var voiceLabel: UILabel!
    @IBOutlet weak var voiceOnButton: UIButton!
    @IBOutlet weak var voiceOffButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
