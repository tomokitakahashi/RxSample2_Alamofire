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
    
    var alamofireMethod : HTTPMethod {
        switch self {
        case .GET:
            return HTTPMethod.get
        default:
            return HTTPMethod.connect
        }
    }
}

class Api {
    
    
    private let manager = SessionManager()

    private var router : ApiRouter
    private var parameters : [String : Any]?
    private var anyMethod : ApiMethod!
    var requestUrl : DataRequest {

      //  print("path :\(path)")
        let req = URL(string: (router.baseUrl+router.path))
        
        return manager.request(req!)
        
        
//        return manager.request(req,method: method.alamofireMethod!, parameters: nil, encoding: .JSON, headers: nil)
        //.request(method.alamofireMethod!, router.baseUrl + path, parameters: nil, encoding: .JSON, headers: nil)
    }
    
    fileprivate init(router : ApiRouter ,method : ApiMethod){
        self.router = router
        self.anyMethod = method
    }
    
    static func createInstance(_ router : ApiRouter,method : ApiMethod) -> Api{
        return Api(router: router, method: method)
    }
    
    func setParameters(_ parameters : [String : AnyObject]) -> Self{
        self.parameters = parameters
        return self
    }
    
    
    
    func request() -> Observable<ResponseModel>{
        
        let observable : Observable<ResponseModel> = Observable.create{ (observer : AnyObserver<ResponseModel>) in
            self.requestUrl.validate().responseJSON(completionHandler : { response in
                print("eeee")
                print(self.requestUrl)
                switch response.result {
                case .success(let value) :
                    guard let object = Mapper<ResponseModel>().map(JSONObject: value) else {
                        return observer.onCompleted()  //when value parse to object is missed
                    }
                    observer.onNext(object)  // object type is 'ResponseModel'
                    observer.onCompleted()
                case .failure(let error) :
                    observer.onError(error)
                }
            })
            return Disposables.create {
                
            }
        
        }
            
        return observable
    }
    

    
    

}
