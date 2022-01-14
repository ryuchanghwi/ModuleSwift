//
//  NotiSecondVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

class NotiSecondVC: UIViewController {
    @IBOutlet weak var notiTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func backButton(_ sender: Any) {
        //이벤트를 알림
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotiFirstVC.notificationName.rawValue), object: notiTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
}
