//
//  Communication.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import Foundation

struct Networking {
    
    // call api and get data
    func callDataApi<T: Codable>(type: T.Type, completion: ((_ response: T) -> Void)?) {
        
        let urlString = Constants.END_POINT
        
        guard let urlRequest = URL(string: urlString ) else { return }
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }
    
}
