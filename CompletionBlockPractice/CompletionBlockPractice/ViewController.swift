//
//  ViewController.swift
//  CompletionBlockPractice
//
//  Created by 류창휘 on 2022/01/03.
//

import UIKit
import KRProgressHUD
class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad() 호출")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            print("컴프레션 블럭으로 넘겨받았음 \(result)")
            
            KRProgressHUD.showSuccess()
            self.mainTitle.text = result
            
        })
    }


    
    
    fileprivate func sayHi(completion: @escaping(String) -> ()) {
        
        print("ViewController - sayHi() 호출됨")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            print("하이")
            completion("하이")
        }
    }
}

