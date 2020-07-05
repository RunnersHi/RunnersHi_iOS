//
//  MainVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/05.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var runButton: UIButton!
    @IBAction func runButtonDidTap(_ sender: Any) {
        //버튼 클릭시 기능 구현
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBasicLayout()
    }
    
    func mainBasicLayout() {
        //logoImg.image = UIImage()
        //runBtn.backgroundColor = UIColor()
        runButton.setTitle("RUN NOW", for: .normal)
    }
    

}
