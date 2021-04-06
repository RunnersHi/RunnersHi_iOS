//
//  CountdownVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/13.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import Lottie

class CountdownVC: UIViewController {
    
    // MARK: Variable Part
    
    let animationView = AnimationView()
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setCountdown()
    }

}

// MARK: Extension

extension CountdownVC {
    
    func setCountdown() {
        
        animationView.animation = Animation.named("count")
        // countdown Lottie 설정
        
        animationView.frame = view.bounds
        // 뷰 크기에 꽉 맞춤
        animationView.backgroundColor = UIColor.salmon
        
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .playOnce
        // 한번만 실행
        
        animationView.play()
        // 로티 실행
        
        view.addSubview(animationView)
        
        animationView.play { finished in
            // 로티 실행이 끝나면 다음 함수 실행
            
            self.setRun()
        }
        
    }
    
    func setRun() {
        
        animationView.animation = Animation.named("run")
        // run 이라는 Lottie 설정

        animationView.frame = view.bounds
        animationView.backgroundColor = UIColor.lightishBlue

        animationView.contentMode = .scaleToFill
        animationView.loopMode = .playOnce
        // 한번만 실행

        animationView.play()
        view.addSubview(animationView)
        
        animationView.play { finished in
            // 로티 실행이 다 끝나면
            
            guard let nextVC = self.storyboard?.instantiateViewController(identifier:"RunActivityVC") as? RunActivityVC else { return }
            self.navigationController?.pushViewController(nextVC, animated: true)
            // 다음 뷰로 이동
            
        }

    }
    
    
}
