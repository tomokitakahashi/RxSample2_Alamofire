//
//  ViewModel.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import RxSwift


class ViewModel : NSObject , UITableViewDataSource {
    
    private var router = Api.Router()
    
    //Variableは監視対象のオブジェクトを指す(ジェネリクス型) => Variable<[Entry]>の'<>'で型を指定する
    private(set) var entries : Variable<[Entry]> = Variable([])
    private(set) var feed : Variable<Feed?> = Variable(nil)
    private(set) var error : Variable<NSError?> = Variable(nil)
    
    
    
    func reloadData(){
        router.getJson()
            .subscribe(onNext: { [weak self] data in
                self?.entries.value = data.responseFeed.entries
            }, onError: { error in
                print("subscribe error code :\(error)")
                self.error.value = error as NSError
            }, onCompleted: { () in
                
            })
        .addDisposableTo(router.disposeBag)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.value.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = entries.value[indexPath.row].title
        return cell
    }
    
    
}
