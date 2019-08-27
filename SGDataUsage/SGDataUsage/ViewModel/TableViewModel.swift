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
    var filteredData: [QuaterDetails?] = []
    
    
    public func getDataUsageInfo(completion: (() -> Void)?) {
        networking.callDataApi(type: DataUsage.self) { [weak self] (response) in
            self?.dataUsage = response
            completion?()
        }
    }
    
    public func cellViewModel(index: Int) -> CellViewModel? {
        guard let data = dataUsage else { return nil }
        
        let cellViewModel = CellViewModel(quater: filterRequiredYears(dataObject: data)[index] ?? nil)
        return cellViewModel
    }
    
    private func filterRequiredYears(dataObject: DataUsage) ->  [QuaterDetails?] {
        
        filteredData = (dataObject.result?.records.filter{
            yearsFilter.contains(where: ($0?.quarter?.contains) ?? Constants.BLANK.contains)
            }) ?? []
        
            return getYearConsumption(detailArray: filteredData)
        
    }
    
    public var count: Int {
        return yearsFilter.count
    }
    
    private func getYearConsumption(detailArray: [QuaterDetails?])  ->  [QuaterDetails?]  {
        
        filteredData.removeAll()
        for year in yearsFilter {
            
            var yearConsumption = 0.0
            for quater in detailArray {
            
                if (quater?.quarter?.contains(year))! {
                    let dataVolume = Double(quater?.volume_of_mobile_data ?? "0") ?? 0
                    yearConsumption = yearConsumption + dataVolume

                }
            }
            
            let quaterDetailObj = QuaterDetails(volume_of_mobile_data: String(yearConsumption), quarter: year, _id: 1, reduction: false)
            filteredData.append(quaterDetailObj)
            
        }
        return filteredData
    }
    
}
