//
//  FriendCell.swift
//  ClientServer
//
//  Created by Alex Larin on 31.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var ShadowView: ShadowView!
    @IBOutlet weak var FriendImageView: UIImageView!
    @IBOutlet weak var FriendLabel: UILabel!
    @IBOutlet weak var LastNameFriendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
