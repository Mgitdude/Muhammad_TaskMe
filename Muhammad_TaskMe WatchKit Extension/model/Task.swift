//
//  Task.swift
//  Muhammad_TaskMe WatchKit Extension
//
//  Created by MUS on 2020-12-11.
//

import Foundation

struct Task: Codable{
    //var id: ObjectIdentifier
    
    var activity: String?

    
    init() {
        //id = nil
        activity = nil
    }
    
    enum CodingKeys: String, CodingKey{
        case activity = "activity"

    }
    
    init(from decoder: Decoder) throws {
        
        let response = try decoder.container(keyedBy: CodingKeys.self)

        self.activity = try response.decodeIfPresent(String.self, forKey: .activity)
    }
    func encode(to encoder: Encoder) throws {
        
    }
}
