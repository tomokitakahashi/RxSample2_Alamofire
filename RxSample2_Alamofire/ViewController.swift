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

    @IBOutlet weak var ResTableView: UITableView!
    
  
    
//    private lazy var hakuba : Hakuba = Hakuba(tableView: self.ResTableView)
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()

        bind()

    }
    
    
    func bind(){
        viewModel.entries.asObservable().filter{ x in
                return !x.isEmpty
            }
            .subscribe(onNext: { [unowned self]data in
                self.ResTableView.reloadData()
                
                }, onError: { data in
                    
                }, onCompleted: { () in
                    
                }){ () in
                    
            }.addDisposableTo(disposeBag)
        
    }
    
    func setViewModel(){
        ResTableView.dataSource = viewModel
        
        viewModel.reloadData()
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}



















