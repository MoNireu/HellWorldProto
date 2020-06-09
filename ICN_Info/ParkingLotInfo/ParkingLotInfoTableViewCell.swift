//
//  ParkingLotInfoTableViewCell.swift
//  ICN_Info
//
//  Created by MoNireu on 2020/06/10.
//  Copyright © 2020 monireu. All rights reserved.
//

import UIKit
import MKRingProgressView

class ParkingLotInfoTableViewCell: UITableViewCell {

    
    @IBOutlet var name: UILabel!
    @IBOutlet var carAvailableLbl: UILabel!
    @IBOutlet var statusIndicator: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        statusIndicator.layer.borderWidth = 1.0
        statusIndicator.layer.cornerRadius = statusIndicator.intrinsicContentSize.height / 1.8
        statusIndicator.setTitleColor(.white, for: .normal)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRingProgressValue(value: Double) {
        
        let ALPHA: CGFloat = 0.8
        
        if value <= 0.5 {
            statusIndicator.setTitle("원활", for: .normal)
            statusIndicator.layer.borderColor = UIColor.systemBlue.cgColor
            statusIndicator.backgroundColor = UIColor.systemBlue.withAlphaComponent(ALPHA)
        }
        else if value <= 0.8 {
            statusIndicator.setTitle("보통", for: .normal)
            statusIndicator.layer.borderColor = UIColor.orange.cgColor
            statusIndicator.backgroundColor = UIColor.orange.withAlphaComponent(ALPHA)
        }
        else {
            statusIndicator.setTitle("혼잡", for: .normal)
            statusIndicator.layer.borderColor = UIColor.systemRed.cgColor
            statusIndicator.backgroundColor = UIColor.systemRed.withAlphaComponent(ALPHA)
        }
    }

}
