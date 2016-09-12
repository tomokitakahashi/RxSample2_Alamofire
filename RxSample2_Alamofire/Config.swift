//
//  Config.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import Foundation


///https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://blog.56doc.net/RSS/*/
protocol configSource {
    var path : String {get}
    var host : String {get}
    var baseUrl : String {get}
}
extension configSource {
    var path : String {
        return "ajax/services/feed/load?v=1.0&q="
    }
    var host : String {
        return "ajax.googleapis.com/"
    }
    var baseUrl : String {
        return "https://" + host
    }
}
struct Environment : configSource {
    static let sharedInstance = Environment()
    
    var feedUrl : String {
        return "http://blog.56doc.net/RSS/"
    }
}

