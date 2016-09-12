//
//  Router.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

///ajax/services/feed/load?v=1.0&q=http://blog.56doc.net/RSS/*/
extension Api {
    struct Router : ApiRouter {
        let env = Environment.sharedInstance
        var path: String {
            return env.path + env.feedUrl
        }
        var baseUrl: String {
            return env.baseUrl
        }
        
        
        let disposeBag = DisposeBag()
        
        func getJson() -> Observable<ResponseModel>{
          //  let parameters = ["v" : "1.0","q":Environment.sharedInstance.feedUrl]
            return Api.createInstance(self, method: .GET)
                    .request()
            
        }

    }
    
    
    
}
