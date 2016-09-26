//
//  ViewModel.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/12.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import RxSwift


class ViewModel : NSObject , UITableViewDataSource{
    
    fileprivate var router = Api.Router()
    
    //Variableは監視対象のオブジェクトを指す(ジェネリクス型) => Variable<[Entry]>の'<>'で型を指定する
    fileprivate(set) var entries : Variable<[Entry]> = Variable([])
    fileprivate(set) var feed : Variable<Feed?> = Variable(nil)
    fileprivate(set) var error : Variable<NSError?> = Variable(nil)
    
    func reloadData(){
        router.getJson()
            .subscribe(onNext: { [weak self] data in
                self?.entries.value = data.responseFeed.entries
                self?.feed.value = data.responseFeed
            }, onError: { error in
                print("subscribe error code :\(error)")
                self.error.value = error as NSError
            }, onCompleted: { () in
                
            })
        .addDisposableTo(router.disposeBag)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.entries.value.count)
        return self.entries.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = entries.value[indexPath.row].title
        return cell
    }
    
    
}
