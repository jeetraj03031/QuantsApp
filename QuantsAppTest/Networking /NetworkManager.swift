//
//  NetworkManager.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 29/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: NSObject{
    
    //MARK: SINGELTON INSTANCE
    static let sharedInstance: NetworkManager = NetworkManager()
    
    //MARK: URL TO GET LATEST
    let FEED_URL = "https://api.androidhive.info/feed/feed.json"
    
    func getFeed(onCompletion: @escaping(_ feed: [Feed],_ error: String)->Void){
        AF.request(FEED_URL).responseData(queue: .global(qos: .background)) { (responsedata) in
            if let data = responsedata.data{
                do{
                    let jsonD = JSONDecoder()
                    let resp = try jsonD.decode(feedRootModel.self, from: data)
                    onCompletion(resp.feed!,"")
                }catch{
                    onCompletion([], "Unable To Parse Response")
                }
            }else{
                onCompletion([], responsedata.error!.localizedDescription)
            }
        }
        
    }
    
    
}
