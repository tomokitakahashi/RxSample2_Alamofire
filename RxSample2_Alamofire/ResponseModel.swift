//
//  Model.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper

class ResponseModel: ResponseBase {
    
    private(set) var responseFeed : Feed!
    
    override func mapping(map : Map){
        responseFeed <- map["responseData.feed"]
    }
    
}
