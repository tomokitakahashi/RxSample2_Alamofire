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
    private(set) var title : String!
    private(set) var feedUrl : NSURL!
    private(set) var author :String!
    private(set) var type : String!
    private(set) var description : String?
    private(set) var entries : [Entry]!
    
    override func mapping(map : Map){
        title <- map["title"]
        feedUrl <- (map["feedURL"],URLTransform())
        author <- map["author"]
        type <- map["type"]
        description <- map["description"]
        entries <- map["entries"]
    }
    
}
