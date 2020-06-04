//
//  TrainTableViewCellCollectionViewCell.swift
//  PoseNet
//
//  Created by Anzer Arkin on 03.06.20.
//  Copyright © 2020 tensorflow. All rights reserved.
//

import UIKit

class TrainTableViewCellCollectionViewCell: UITableViewCell {
    
    
    @IBOutlet weak var trainImage: UIImageView!
    @IBOutlet weak var trainLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        trainLabel.font = UIFont(name: "CourierNewPS-BoldMT", size: 24.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
