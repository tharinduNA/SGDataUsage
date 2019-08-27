//
//  CellViewModel.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import Foundation

class CellViewModel {
    
    private let quater: QuaterDetails
    
    init(quater: QuaterDetails) {
        self.quater = quater
    }
    
    var dataVolume: String {
        return quater.volume_of_mobile_data ?? "0"
        
    }
    

    
}
