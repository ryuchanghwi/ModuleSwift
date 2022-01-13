//
//  PropertySecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/12.
//

import Foundation
import UIKit

class PropertySecondVC: UIViewController {
    @IBOutlet weak var propertySecondTextLabel: UILabel!
    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.propertySecondTextLabel.text = text
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
