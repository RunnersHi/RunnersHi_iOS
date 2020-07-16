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
    
    @IBAction func goButtonDidTab(_ sender: Any) {
        guard let GoResult = self.storyboard?.instantiateViewController(identifier:"ResultRunningVC") as? ResultRunningVC else {return}
        self.navigationController?.pushViewController(GoResult, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        FindRunnerVC.socket.on("compareResult", callback: { (data, ack) in
            UserDefaults.standard.set(data[1], forKey: "runIdx")
            FindRunnerVC.socket.disconnect()
            self.goButton.backgroundColor = UIColor.lightishBlue
            self.goButton.isSelected = true

        })
    }
    //{roomName: “2", distance: 2, time: 3600,coordinates: [[1,2,3],[1,2,3]], createdTime: “2020-07-16 18:29:24”, endTime: “2020-07-16 18:29:54"}
    
    
}
extension RunFinishVC {
    func setView() {
        let onedic : [String : Double] = ["latitude":37.49974666666667,"longitude":127.030015]
        let twodic : [String : Double] = ["latitude":37.499723333333336,"longitude":127.02958833333332]
        let threedic : [String : Double] = ["latitude":37.49929833333333,"longitude":127.02822666666667]
        let fourdic : [String : Double] = ["latitude":37.499696666666665,"longitude":127.02766333333332]
        let array2 = [onedic, twodic,threedic,fourdic]
//        FindRunnerVC.socket.emit("compareResult",UserDefaults.standard.object(forKey: "opponentRoom") as? String ?? " ",UserDefaults.standard.object(forKey: "opponetDistance") as? Int ?? 2,UserDefaults.standard.object(forKey: "myGoalTime") as? Int ?? 0,array2,UserDefaults.standard.object(forKey: "createdTime") as? String ?? " ",UserDefaults.standard.object(forKey: "endTime") as? String ?? " ")
        FindRunnerVC.socket.emit("compareResult",UserDefaults.standard.object(forKey: "opponentRoom") as? String ?? " ",UserDefaults.standard.object(forKey: "opponetDistance") as? Int ?? 2,60,array2,UserDefaults.standard.object(forKey: "createdTime") as? String ?? " ",UserDefaults.standard.object(forKey: "endTime") as? String ?? " ")
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
        
        goButton.isSelected = false
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

