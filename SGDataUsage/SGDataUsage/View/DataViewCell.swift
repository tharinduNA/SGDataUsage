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

    public var viewModel: CellViewModel? {
        didSet {
            
            
            guard let viewModel = viewModel else { return }
            self.dataUsage.text = viewModel.dataVolume
            self.yearLabel.text = viewModel.year
            self.flag.isHidden = !viewModel.flag
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(callTapGesture))
            flag.addGestureRecognizer(tapGesture)
            flag.isUserInteractionEnabled = true
            
        }
    }
    
    @objc func callTapGesture() {
        print("You tapped image")
    }
    
}
