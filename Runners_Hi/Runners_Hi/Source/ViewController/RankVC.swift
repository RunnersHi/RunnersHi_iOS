//
//  RankVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/06.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RankVC: UIViewController {
    static let identifier: String = "RankVC"
    var monthlyRankingModel: RankingData<Monthly>?
    var winnerRankingModel: RankingData<Winner>?
    var loserRankingModel: RankingData<Loser>?
    
    @IBOutlet weak var monthlyCollectionView: UICollectionView!
    @IBOutlet weak var winnerCollectionView: UICollectionView!
    @IBOutlet weak var loserCollectionView: UICollectionView!
    @IBOutlet weak var RankVC_View: UIView!
    
    @IBOutlet weak var monthlyMain: UILabel!
    @IBOutlet weak var monthlyDetail: UILabel!
    @IBOutlet weak var winnerMain: UILabel!
    @IBOutlet weak var winnerDetail: UILabel!
    @IBOutlet weak var loserMain: UILabel!
    @IBOutlet weak var loserDetail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RankVC_View.backgroundColor = .backgroundgray
        
        monthlyCollectionView.delegate = self
        monthlyCollectionView.dataSource = self
        monthlyCollectionView.backgroundColor = .backgroundgray
        
        winnerCollectionView.delegate = self
        winnerCollectionView.dataSource = self
        winnerCollectionView.backgroundColor = .backgroundgray

        loserCollectionView.delegate = self
        loserCollectionView.dataSource = self
        loserCollectionView.backgroundColor = .backgroundgray

        
        getMonthly()
        getWinner()
        getLoser()
        
        hidescroll()
        labelSetting()
    }
    
}

extension RankVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == monthlyCollectionView {
            return monthlyRankingModel?.result.count ?? 0
        }
        else if collectionView == winnerCollectionView {
            return winnerRankingModel?.result.count ?? 0
        }
        else {
            return loserRankingModel?.result.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == monthlyCollectionView{
            guard let MonthlyCell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthlyCell.identifier, for: indexPath) as? MonthlyCell else {return UICollectionViewCell() }
          
            
            let num = indexPath.row
            MonthlyCell.monthlyRankNum.text = "\(num+1)"
            
            let  profileImage = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
                    
            let profileFlag = monthlyRankingModel?.result[indexPath.row].image as? Int ?? 0
            
            MonthlyCell.monthlyRankProfile.image = UIImage(named: profileImage[profileFlag-1])
            
            MonthlyCell.monthlyRankName.text = monthlyRankingModel?.result[indexPath.row].nickname as? String ?? " "
            
            
            let m: Float = Float(monthlyRankingModel?.result[indexPath.row].distanceSum ?? 0)
            let km : Float = floor(m*10)/1000
            MonthlyCell.monthlyRankDistance.text = "\(km)" + "km"

            return MonthlyCell
        }
        else if collectionView == winnerCollectionView{
            guard let WinnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: WinnerCell.identifier, for: indexPath) as? WinnerCell else {return UICollectionViewCell() }
            
            let num2 = indexPath.row
                      WinnerCell.winnerRankNum.text = "\(num2+1)"
            
                let profileFlag2 =          winnerRankingModel?.result[indexPath.row].image as? Int ?? 0
                       
                   let  profileImage = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
            
                   WinnerCell.winnerRankProfile.image = UIImage(named: profileImage[profileFlag2-1])
                   
                   WinnerCell.winnerRankName.text = winnerRankingModel?.result[indexPath.row].nickname as? String ?? " "
             
            let win: Int = winnerRankingModel?.result[indexPath.row].win as? Int ?? 0
            let lose: Int = winnerRankingModel?.result[indexPath.row].lose as? Int ?? 0
                   WinnerCell.winnerRankScore.text = "\(win)" + "승" + "\(lose)" + "패"

            
            return WinnerCell
        }
        else{
            guard let LoserCell = collectionView.dequeueReusableCell(withReuseIdentifier: LoserCell.identifier, for: indexPath) as? LoserCell else {return UICollectionViewCell() }
            
            let num3 = indexPath.row
                      LoserCell.loserRankNum.text = "\(num3+1)"
            
            let profileFlag3 =          loserRankingModel?.result[indexPath.row].image as? Int ?? 0
                                 
                             let  profileImage = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
                      
                             LoserCell.loserRankProfile.image = UIImage(named: profileImage[profileFlag3-1])
                             
                             LoserCell.loserRankName.text = loserRankingModel?.result[indexPath.row].nickname as? String ?? " "
                       
                      let win: Int = loserRankingModel?.result[indexPath.row].win as? Int ?? 0
                      let lose: Int = loserRankingModel?.result[indexPath.row].lose as? Int ?? 0
                             LoserCell.loserRankScore.text = "\(win)" + "승" + "\(lose)" + "패"
            
            return LoserCell
            
        }
    }
   

         
            
    
    
}

extension RankVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
        
        if collectionView == monthlyCollectionView {
            return CGSize(width: 126, height: 126)
        }
        else if collectionView == winnerCollectionView {
            return CGSize(width : 126, height: 126)
        }
        else {
            return CGSize(width: 126, height: 126)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == monthlyCollectionView  {
            return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        }
        else if collectionView == winnerCollectionView {
            return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == monthlyCollectionView {
            return 0
        }
        else if collectionView == winnerCollectionView {
            return 0
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == monthlyCollectionView {
            return 0
        }
        else if collectionView == winnerCollectionView {
            return 0
        }
        else {
            return 0
        }
    }
    
}

extension RankVC {
    func getMonthly(){
        RankingService.shared.monthlyRankingloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! RankingData<Monthly>
                self.monthlyRankingModel = response
                self.monthlyCollectionView.reloadData()
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
        
        let layout1 = monthlyCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout1.scrollDirection = .horizontal // 가로스크롤
    }
    
    func getWinner(){
        RankingService.shared.winnerRankingloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response2 = res as! RankingData<Winner>
                self.winnerRankingModel = response2
                self.winnerCollectionView.reloadData()
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
        
        let layout2 = winnerCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
          layout2.scrollDirection = .horizontal // 가로스크롤
        
    }
    
    func getLoser(){
        RankingService.shared.loserRankingloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response3 = res as! RankingData<Loser>
                self.loserRankingModel = response3
                self.loserCollectionView.reloadData()
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
        
        let layout3 = loserCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
             layout3.scrollDirection = .horizontal // 가로스크롤
    }
    func hidescroll(){
        monthlyCollectionView.showsHorizontalScrollIndicator = false
        monthlyCollectionView.showsVerticalScrollIndicator = false
        
        
        winnerCollectionView.showsHorizontalScrollIndicator = false
        winnerCollectionView.showsVerticalScrollIndicator = false
        
        
        loserCollectionView.showsHorizontalScrollIndicator = false
        loserCollectionView.showsVerticalScrollIndicator = false
        
    }
    
    func labelSetting(){
        monthlyMain.text = "이달의 러너"
        monthlyDetail.text = "7월 한 달 가장 많이 달린 러너"
        winnerMain.text = "명예의 전당"
        winnerDetail.text = "7월 한 달 가장 많은 승리를 거둔 러너"
        loserMain.text = "졌.잘.싸"
        loserDetail.text = "7월 한 달 아쉽게 졌지만 열심히 러닝한 러너"
        
        monthlyMain.font = UIFont(name: "NanumSquareB", size:20.0)
        monthlyDetail.font = UIFont(name: "NanumSquareR", size:14.0)
        winnerMain.font = UIFont(name: "NanumSquareB", size:20.0)
        winnerDetail.font = UIFont(name: "NanumSquareR", size:14.0)
        loserMain.font = UIFont(name: "NanumSquareB", size:20.0)
        loserDetail.font = UIFont(name: "NanumSquareR", size:14.0)
        
        self.view.backgroundColor = .backgroundgray
    }
}

