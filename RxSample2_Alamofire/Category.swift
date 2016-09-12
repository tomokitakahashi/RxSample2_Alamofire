//
//  Category.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper

class Category: ResponseBase {
    private(set) var category : String!
    
    override func mapping(map: Map) {
      //  category <- map[]
        
    }
    
}
