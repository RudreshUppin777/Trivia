//
//  GamesTableviewCellTableViewCell.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit

class GamesTableviewCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var username: UILabel!

    @IBOutlet weak var flags: UILabel!
    
    @IBOutlet weak var cricketer: UILabel!
    
    @IBOutlet weak var time: UILabel!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
