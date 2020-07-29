//
//  Feed.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 29/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import Foundation
 struct Feed : Codable {

        let id : Int?
        let image : String?
        let name : String?
        let profilePic : String?
        let status : String?
        let timeStamp : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case id = "id"
                case image = "image"
                case name = "name"
                case profilePic = "profilePic"
                case status = "status"
                case timeStamp = "timeStamp"
                case url = "url"
        }
    
    init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                image = try values.decodeIfPresent(String.self, forKey: .image)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
                status = try values.decodeIfPresent(String.self, forKey: .status)
                timeStamp = try values.decodeIfPresent(String.self, forKey: .timeStamp)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
