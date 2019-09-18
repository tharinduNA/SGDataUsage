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
        let dataVol = Double(quater?.volume_of_mobile_data ?? "0")
        return String(format: "%.2f", dataVol ?? 0)
    }
    
    var year: String {
        return quater?.quarter ?? Constants.BLANK
    }
    
    var flag: Bool {
        return quater?.reduction ?? false
    }
    
    
}
