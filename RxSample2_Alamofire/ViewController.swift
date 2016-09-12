//
//  ViewController.swift
//  RxSample2_Alamofire
//
//  Created by takahashi tomoki on 2016/09/11.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()
        binding()
    }
    
    func setViewModel(){
        tableView.dataSource = viewModel
        
        viewModel.reloadData()
    }
    
    func binding(){
        viewModel.entries.asObservable().filter { data in
            return !data.isEmpty
            }.subscribe(onNext: { [unowned self] data in
                
                self.tableView.reloadData()
                }, onError: { error in
                    
                }, onCompleted: {
                    
            }) { () in
                
        }.addDisposableTo(disposeBag)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

