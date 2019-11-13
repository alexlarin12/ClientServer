//
//  GroupCell.swift
//  ClientServer
//
//  Created by Alex Larin on 06.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var ShadowView: ShadowView!
    @IBOutlet weak var GroupImageView: UIImageView!
    @IBOutlet weak var GroupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
