//
//  ViewController.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Test Network
        ManagerBankservice()
            .fetchAllBanks()
            .observe(on: MainScheduler.instance)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: { (data) in

                print(data)
                
            },onError: { (error) in
                print(error)

            },onCompleted: {
                print("onCompleted")

            })
            .disposed(by: self.disposeBag)
    }


}

