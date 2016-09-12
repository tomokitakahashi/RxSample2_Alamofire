//
//  Api.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import RxSwift
import RxCocoa

protocol ApiPath {
    var path : String {get}
}

protocol ApiRouter : ApiPath {
    var baseUrl : String {get}
}
enum ApiMethod : String{
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
    
    var alamofireMethod : Alamofire.Method {
        switch self {
        case .GET:
            return Alamofire.Method.GET
        default:
            return Alamofire.Method.DELETE
        }
    }
}

class Api {
    
    
    private let manager = Alamofire.Manager()

    private var router : ApiRouter
    private var parameters : [String : AnyObject]?
    private var method : ApiMethod
    private var requestUrl : Request {
        let path = router.path
        print("path      :\(path)")
        let request = manager.request(method.alamofireMethod, router.baseUrl + path, parameters: nil, encoding: .JSON, headers: nil)
        return request
    }
    
    private init(router : ApiRouter ,method : ApiMethod){
        self.router = router
        self.method = method
    }
    
    static func createInstance(router : ApiRouter,method : ApiMethod) -> Api{
        return Api(router: router, method: method)
    }
    
    func setParameters(parameters : [String : AnyObject]) -> Self{
        self.parameters = parameters
        return self
    }
    
    
    
    func request() -> Observable<ResponseModel>{
        print("aaaaaaaaa")
        print(parameters)
        print(requestUrl)
        
        let observable : Observable<ResponseModel> = Observable.create{ (observer : AnyObserver<ResponseModel>) in
            self.requestUrl.validate().responseJSON(completionHandler : { response in
                print("eeee")
                print(self.requestUrl)
                switch response.result {
                case .Success(let value) :
                    guard let object = Mapper<ResponseModel>().map(value) else {
                        return observer.onCompleted()  //when value parse to object is missed
                    }
                    observer.onNext(object)  // object type is 'ResponseModel'
                    observer.onCompleted()
                case .Failure(let error) :
                    observer.onError(error)
                }
            })
            return AnonymousDisposable {
                
            }
        
        }
            
        return observable
    }
    

    
    

}
