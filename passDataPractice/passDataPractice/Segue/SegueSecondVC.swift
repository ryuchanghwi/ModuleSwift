//
//  SegueSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/12.
//

import Foundation
import UIKit

class SegueSecondVC: UIViewController {
    @IBOutlet weak var segueTextLabel: UILabel!
    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segueTextLabel.text = text
    }
    @IBAction func backButton(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
}
