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
    
    
    override func viewDidLoad() {
        monthlyCollectionView.delegate = self
        monthlyCollectionView.dataSource = self
        
        winnerCollectionView.delegate = self
        winnerCollectionView.dataSource = self
        
        
        loserCollectionView.delegate = self
        loserCollectionView.dataSource = self
        
        getMonthly()
        getWinner()
        getLoser()
        super.viewDidLoad()
        
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
            return MonthlyCell
        }
        else if collectionView == winnerCollectionView{
            guard let WinnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: WinnerCell.identifier, for: indexPath) as? WinnerCell else {return UICollectionViewCell() }
            return WinnerCell
        }
        else{
            guard let LoserCell = collectionView.dequeueReusableCell(withReuseIdentifier: LoserCell.identifier, for: indexPath) as? LoserCell else {return UICollectionViewCell() }
            return LoserCell
            //              guard let OpenSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: OpenSelectCell.identifier, for: indexPath) as? OpenSelectCell else {return UICollectionViewCell()}
            //              OpenSelectCell.set(openList[indexPath.row])
            //              return OpenSelectCell
        }
    }
}

extension RankVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
        
        if collectionView == monthlyCollectionView {
            return CGSize(width: 152, height: 48)
        }
        else if collectionView == winnerCollectionView {
            return CGSize(width : 97, height:48)
        }
        else {
            return CGSize(width: 152, height: 48)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == monthlyCollectionView  {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else if collectionView == winnerCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        if collectionView == monthlyCollectionView {
            return 11
        }
        else if collectionView == winnerCollectionView {
            return 12
        }
        else {
            return 12
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
    }
}

