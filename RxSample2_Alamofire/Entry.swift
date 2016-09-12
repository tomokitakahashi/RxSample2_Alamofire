//
//  Entry.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper


class Entry : ResponseBase {
    private(set) var title : String!
    private(set) var link : NSURL!
    private(set) var author : String!
    private(set) var publishedDate : NSDate!
    private(set) var content : String!
    private(set) var category: String!
    
    override func mapping(map: Map) {
        title <- map["title"]
        link <- (map["link"],URLTransform())
        author <- map["author"]
        publishedDate <- (map["publishedDate"],DateTransform())
        content <- map["content"]
        category <- map["category"]        
    }
    
    
    
}
