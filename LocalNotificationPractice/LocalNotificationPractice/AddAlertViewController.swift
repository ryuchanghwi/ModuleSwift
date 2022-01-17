//
//  AddAlertViewController.swift
//  LocalNotificationPractice
//
//  Created by 류창휘 on 2022/01/17.
//

import Foundation
import UIKit

class AddAlertViewController: UIViewController {
    //클로저
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
        
    }
}
