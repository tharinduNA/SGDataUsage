//
//  DataViewCellTableViewCell.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell {

    @IBOutlet weak var dataUsage: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var flag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public var viewModel: CellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.dataUsage.text = viewModel.dataVolume
            self.yearLabel.text = viewModel.year
            self.flag.isHidden = !viewModel.flag
        }
    }
}
