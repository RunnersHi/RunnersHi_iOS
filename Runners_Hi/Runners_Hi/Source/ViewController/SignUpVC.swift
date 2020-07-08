//
//  SignUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate, UICollectionViewDelegate {
    static let identifier: String = "SignUpVC"
    
    @IBOutlet weak var genderbuttonCollectionView: UICollectionView!
    @IBOutlet weak var levelbuttonCollectionView: UICollectionView!
    @IBOutlet weak var openbuttonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonList()
        genderbuttonCollectionView.delegate = self
        genderbuttonCollectionView.dataSource = self
        self.genderbuttonCollectionView.isScrollEnabled = false
        
        levelbuttonCollectionView.delegate = self
        levelbuttonCollectionView.dataSource = self
        self.levelbuttonCollectionView.isScrollEnabled = false
        
        openbuttonCollectionView.delegate = self
        openbuttonCollectionView.dataSource = self
        self.openbuttonCollectionView.isScrollEnabled = false
        
        
    }
    
    
    private var genderList : [Gender] = []
    private var levelList : [Level] = []
    private var openList : [Open] = []
    
    func setButtonList(){
        let Gender1 = Gender(genderbuttonName: "남성")
        let Gender2 = Gender(genderbuttonName: "여성")
        
        let Level1 = Level(levelbuttonName: "초급")
        let Level2 = Level(levelbuttonName : "중급")
        let Level3 = Level(levelbuttonName: "고급")
        
        let Open1 = Open(openbuttonName : "공개")
        let Open2 = Open(openbuttonName : "비공개")
        
        genderList = [Gender1, Gender2]
        levelList = [Level1, Level2, Level3]
        openList = [Open1, Open2]
    }
}



extension SignUpVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return genderList.count
        if collectionView == genderbuttonCollectionView{
            return genderList.count}
        else if  collectionView == levelbuttonCollectionView{return levelList.count}
        else {
            return openList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == genderbuttonCollectionView{
            guard let GenderSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: GenderSelectCell.identifier, for: indexPath) as? GenderSelectCell else {return UICollectionViewCell() }
            GenderSelectCell.set(genderList[indexPath.row])
            return GenderSelectCell}
        else if collectionView == levelbuttonCollectionView{
            guard let LevelSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelSelectCell.identifier, for: indexPath) as? LevelSelectCell else {return UICollectionViewCell()}
            LevelSelectCell.set(levelList[indexPath.row])
            return LevelSelectCell}
        else{
            guard let OpenSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: OpenSelectCell.identifier, for: indexPath) as? OpenSelectCell else {return UICollectionViewCell()}
            OpenSelectCell.set(openList[indexPath.row])
            return OpenSelectCell
        }
    }
}

extension SignUpVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
        /*
         //        let screenRect = UIScreen.main.bounds
         //        let frameWidth = screenRect.size.width
         //        let frameHeight = screenRect.size.height
         
         //        return CGSize(width: 152, height: 48)
         */
        if collectionView == genderbuttonCollectionView{
            return CGSize(width: 152, height: 48)}
        else if collectionView == levelbuttonCollectionView{
            return CGSize(width : 97, height:48)}
        else {return CGSize(width: 152, height: 48)}
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == genderbuttonCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)}
        else if collectionView == levelbuttonCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == genderbuttonCollectionView{
            return 11}
        else if collectionView == levelbuttonCollectionView{
            return 12
        }
        else {
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == genderbuttonCollectionView{
            return 0}
        else if collectionView == levelbuttonCollectionView{
            return 0
        }
        else {
            return 0}
    }
    
    
}

