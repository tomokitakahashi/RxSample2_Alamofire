//
//  Entry.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper


class Entry : ResponseBase {
    fileprivate(set) var title : String!
    fileprivate(set) var link : URL!
    fileprivate(set) var author : String!
    fileprivate(set) var publishedDate : Date!
    fileprivate(set) var content : String!
    fileprivate(set) var category: String!
    
    override func mapping(map: Map) {
        title <- map["title"]
        link <- (map["link"],URLTransform())
        author <- map["author"]
        publishedDate <- (map["publishedDate"],DateTransform())
        content <- map["content"]
        category <- map["category"]        
    }
    
    
    
}
