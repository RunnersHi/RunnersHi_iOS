//
//  SplashVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/17.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    
   var animationView: AnimationView?

   override func viewDidLoad() {
       super.viewDidLoad()
    print("요깅")
       animationView = AnimationView(name: "splash")
    animationView?.contentMode = .scaleAspectFit
       animationView?.frame = self.view.bounds
       animationView?.play()
       // Do any additional setup after loading the view.
       self.view.addSubview(animationView!)
       Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(aaaa), userInfo: nil, repeats: false)
   }
   
   
   @objc func aaaa() {
       guard let storyboard = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(identifier: "SignInVC") as? SignInVC else { return }
       UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = storyboard
   }

}
