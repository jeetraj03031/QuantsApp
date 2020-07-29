//
//  feedRootModel.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 29/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import Foundation
struct feedRootModel : Codable {

        let feed : [Feed]?

        enum CodingKeys: String, CodingKey {
                case feed = "feed"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                feed = try values.decodeIfPresent([Feed].self, forKey: .feed)
        }

}
