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
    var winnerRankingloading: RankingData<Winner>?
    var loserRankingloading: RankingData<Loser>?
    
    @IBOutlet weak var monthlyCollectionView: UICollectionView!
    @IBOutlet weak var winnerCollectionView: UICollectionView!
    @IBOutlet weak var loserCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension RankVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == monthlyCollectionView {
            return monthlyRankingModel?.result.count ?? 0
        }
        else if collectionView == winnerCollectionView {
            return winnerRankingloading?.result.count ?? 0
        }
        else {
            return loserRankingloading?.result.count ?? 0
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

