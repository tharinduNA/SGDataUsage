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
    
    public func cellViewModel(index: Int) -> CellViewModel? {
        guard let data = dataUsage else { return nil }
        let cellViewModel = CellViewModel(quater: (data.result?.records[index])!)
        return cellViewModel
    }
    
    public var count: Int {
        return dataUsage?.result?.records.count ?? 0
    }
    
}
