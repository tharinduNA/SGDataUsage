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
    
    let yearsFilter = ["2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"]

    public func getDataUsageInfo(completion: (() -> Void)?) {
        networking.callDataApi(type: DataUsage.self) { [weak self] (response) in
            self?.dataUsage = response
            completion?()
        }
    }
    
    public func cellViewModel(index: Int) -> CellViewModel? {
        guard let data = dataUsage else { return nil }
        
        let cellViewModel = CellViewModel(quater: getYearConsumption(dataObject: data)[index] ?? nil)
        return cellViewModel
    }
    
    private func getYearConsumption(dataObject: DataUsage) ->  [QuaterDetails?] {
        return (dataObject.result?.records.filter{
            yearsFilter.contains(where: ($0?.quarter?.contains) ?? Constants.BLANK.contains)
            }) ?? []
    }
    
    public var count: Int {
//        return dataUsage?.result?.records.count ?? 0
        return 44
    }
    
}
