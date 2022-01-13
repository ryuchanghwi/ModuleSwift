//
//  Property&funcSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit
class FunctionSecondVC: UIViewController {
    @IBOutlet weak var textFIeld: UITextField!
    
    var mainVC: FunctionFIrstVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: Any) {
        mainVC?.passData(data: self.textFIeld.text ?? "")
        self.dismiss(animated: true, completion: nil)
    }
    
}
