//
//  CellViewModel.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import Foundation

class CellViewModel {
    
    private let quater: QuaterDetails?
    
    init(quater: QuaterDetails?) {
        self.quater = quater ?? nil
    }
    
    var dataVolume: String {
        return quater?.volume_of_mobile_data ?? Constants.BLANK
    }
    
    var year: String {
        return quater?.quarter ?? Constants.BLANK
    }
    
}
