//
//  DataViewCellTableViewCell.swift
//  SGDataUsage
//
//  Created by Sachinthana Senevirathna on 27/8/19.
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell {

    @IBOutlet weak var dataUsage: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
