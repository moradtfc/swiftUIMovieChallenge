//
//  Utils.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 15/3/22.
//

import Foundation

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
       
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
}
