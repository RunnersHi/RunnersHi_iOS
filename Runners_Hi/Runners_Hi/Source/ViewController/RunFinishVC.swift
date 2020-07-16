//
//  RunFinishVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/15.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RunFinishVC: UIViewController {

    
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var firstMentLabel: UILabel!
    @IBOutlet weak var secondMentLabel: UILabel!
    
    @IBOutlet weak var mainimage: UIImageView!
    
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        FindRunnerVC.socket.on("compareResult", callback: { (data, ack) in
            FindRunnerVC.socket.disconnect()
            guard let LetsRun = self.storyboard?.instantiateViewController(identifier:"OpponentProfileVC") as? OpponentProfileVC else {return}
            self.navigationController?.pushViewController(LetsRun, animated: true)
        })
    }
    //{roomName: “2", distance: 2, time: 3600,coordinates: [[1,2,3],[1,2,3]], createdTime: “2020-07-16 18:29:24”, endTime: “2020-07-16 18:29:54"}
    
    
}
extension RunFinishVC {
    func setView() {
//        var send : sendMessage? = sendMessage(roomName: UserDefaults.standard.object(forKey: "opponentRoom") as? String ?? " ", distance: UserDefaults.standard.object(forKey: "opponetDistance") as? Int ?? 2,time: UserDefaults.standard.object(forKey: "myGoalTime") as? Int ?? 0,coordinates: [[1,2,3],[1,2,3]], createdTime: UserDefaults.standard.object(forKey: "createdTime") as? String ?? " ", endTime: UserDefaults.standard.object(forKey: "endTime") as? String ?? " ")
//        print("도랑",send, type(of: send))
       // FindRunnerVC.socket.emit("compareResult",send)
        finishLabel.text = "FINISH!"
        finishLabel.textAlignment = .center
        finishLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 52)
        finishLabel.textColor = UIColor.lightishBlue
        
        firstMentLabel.text = "재밌게 달리셨나요?"
        firstMentLabel.textAlignment = .center
        firstMentLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        secondMentLabel.text = "누가 더 많이 뛰었는지 비교 중이에요"
        secondMentLabel.font = UIFont(name: "NanumSquareB", size: 16)
        secondMentLabel.textAlignment = .center
        
       // mainimage.image = UIImage(named: <#T##String#>)
        
        goButton.setTitle("결과 보러가기", for: .normal)
        goButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:16)
        goButton.setTitleColor(.white, for: .normal)
        goButton.backgroundColor = UIColor.veryLightPink
        goButton.layer.cornerRadius = 8
        
    }
}
struct sendMessage {
    var roomName : String?
    var distance : Int?
    var time: Int?
    var coordinates : Array<Any>?
    var createdTime : String?
    var endTime : String?
}

