//
//  FindRunnerVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import SocketIO
let managers = SocketManager(socketURL: URL(string: "http://13.125.20.117:3000")!, config: [.log(true), .compress])
let socket = managers.defaultSocket

class FindRunnerVC: UIViewController {

    let maxTime: Float = 300.0
    var moveTime: Float = 0.0
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var timeProgressBar: UIProgressView!

    @IBOutlet weak var mentTextView: UITextView!
    
    @IBOutlet weak var mentTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mentStopButton: UIButton!
    override func viewDidLoad() {
        //SocketIOManager.shared.establishConnection()
        //SocketIOManager.shared.establishConnection()
        socket.connect()
        super.viewDidLoad()
        basicAutoLayout()
        // Do any additional setup after loading the view.
    }
    private func basicAutoLayout() {
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.backgroundgray
        logoImage.image = UIImage(named: "matchLogo")
        timeProgressBar.setProgress(moveTime, animated: true)
        perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
        timeProgressBar.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        timeProgressBar.layer.cornerRadius = 3
        timeProgressBar.clipsToBounds = true
        mentTextView.font = UIFont(name: "NanumSquare", size: 18)
        mentTextView.textAlignment = .center
        mentTextView.backgroundColor = UIColor.backgroundgray
        //textView 수정 불가하게 하기
        mentTextView.isEditable = false
       // mentTextViewHeight.constant = mentTextView.contentSize.height
        mentStopButton.setTitle("매칭 중단하기", for: .normal)
        mentStopButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        mentStopButton.setTitleColor(.white, for: .normal)
        mentStopButton.backgroundColor = UIColor.lightishBlue
        mentStopButton.layer.cornerRadius = 8
    }
    @objc func updateProgressbar() {
        moveTime = moveTime + 1.0
        timeProgressBar.progress = moveTime/maxTime
        
        if moveTime < maxTime {
            perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
        } else {
            moveTime = 0.0
        }
    }
    

}
