//
//  ViewController1.swift
//  RxSwift-iOS-Demo
//
//  Created by Ankit Kumar on 05/04/2018.
//  Copyright © 2018 Ankit Kumar. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CreateOperatorViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }
    
    override func btnAction(_ sender: Any)  {
        
        let source : Observable = Observable<String>.create { observer in
            for i in 1...10{
                observer.on(.next("\(i)"))
            }
            observer.on(.completed)
            return Disposables.create {
                self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n" + " Disposable disposed"
            }
        }
        source.subscribe(
            onNext: {
                self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n onNext " + "\($0)"
                print($0)
            },onCompleted : {
                self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n" + " onCompleted"
            },onDisposed: {
                self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n" + " onDisposed"
            }
        )
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
