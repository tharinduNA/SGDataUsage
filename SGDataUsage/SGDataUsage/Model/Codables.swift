//
//  Codables.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import Foundation

struct DataUsage: Codable {
    let help: String?
    let success: Bool?
    let result: Records?
}

struct Records: Codable {
    let records: [QuaterDetails?]
}

struct QuaterDetails: Codable {
    let volume_of_mobile_data: String?
    let quarter: String?
    let _id: Int?
    let reduction: Bool?
}
