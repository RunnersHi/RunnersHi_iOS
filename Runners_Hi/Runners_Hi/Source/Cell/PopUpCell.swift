//
//  PopUpCell.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class PopUpCell: UITableViewCell {
    static let identifier: String = "PopUpCell"

    
    @IBOutlet weak var battleLabel: UILabel!
    
    @IBOutlet weak var enterImage: UIImageView!
    override func awakeFromNib() {
        enterImage.image = UIImage(named: "iconEnter")
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setbattleInformation(ment: String) {
        battleLabel.setLabel(text: ment, color: .black, font: .nanumBold(size: 20))
    }

}
