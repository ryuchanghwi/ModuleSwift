//
//  DelegationSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

protocol LabelChangeDelegate {
    func onChange(data: String)
}

class DelegationSecondVC: UIViewController {
    
    @IBOutlet weak var delegateTextField: UITextField!
    
    var delegate: LabelChangeDelegate?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func delegateButton(_ sender: Any) {
        if let text = delegateTextField.text {
            delegate?.onChange(data: text)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
}
