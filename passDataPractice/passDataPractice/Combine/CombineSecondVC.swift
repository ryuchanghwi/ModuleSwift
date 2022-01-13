//
//  CombineSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit
import Combine

class CombineSecondVC: UIViewController {
    @IBOutlet weak var combineTextField: UITextField!
    
    //클릭이 되었다는 패스 쓰루 서브젝트
    var didClickSubject = PassthroughSubject<String, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.didClickSubject.send(combineTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}
