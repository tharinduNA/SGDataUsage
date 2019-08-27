//
//  TableViewModel.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import Foundation


class TableViewModel {
    
    private let networking = Networking()
    
    private var dataUsage: DataUsage?
    
    public func getDataUsageInfo(completion: (() -> Void)?) {
        networking.callDataApi(type: DataUsage.self) { [weak self] (response) in
            self?.dataUsage = response
            completion?()
        }
    }
    
    public var count: Int {
        return 2 //TODO return correct count
    }
    
}
