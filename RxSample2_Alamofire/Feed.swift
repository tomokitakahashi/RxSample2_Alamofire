//
//  Feed.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import ObjectMapper

class Feed : ResponseBase {
    fileprivate(set) var title : String!
    fileprivate(set) var feedUrl : URL!
    fileprivate(set) var author :String!
    fileprivate(set) var type : String!
    fileprivate(set) var description : String?
    fileprivate(set) var entries : [Entry]!
    
    override func mapping(map : Map){
        title <- map["title"]
        feedUrl <- (map["feedURL"],URLTransform())
        author <- map["author"]
        type <- map["type"]
        description <- map["description"]
        entries <- map["entries"]
    }
    
}
