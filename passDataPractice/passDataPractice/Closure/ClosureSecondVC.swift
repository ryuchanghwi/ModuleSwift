//
//  ClosureSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

class ClosureSecondVC : UIViewController {
    
    @IBOutlet weak var delegateTextField: UITextField!
    
    var didClick : ((String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        didClick?(delegateTextField.text ?? "")
    }
}
