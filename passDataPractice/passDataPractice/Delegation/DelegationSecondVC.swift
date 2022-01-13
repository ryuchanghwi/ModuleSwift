//
//  DelegationSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

class DelegationSecondVC: UIViewController, LabelChangeDelegate {
    
    @IBOutlet weak var delegateTextField: UITextField!
    
    
    
    func onChange() {
        mainVC?.delegateLabel.text = delegateTextField.text
    }
    var mainVC : DelegationFirstVC?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func delegateButton(_ sender: Any) {
        onChange()
        self.dismiss(animated: true, completion: nil)
    }
}
