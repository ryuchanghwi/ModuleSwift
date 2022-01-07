//
//  ThirdViewController.swift
//  NotificationCenterPractice
//
//  Created by 류창휘 on 2022/01/05.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goFirstVCBtn(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func goThirdVCBtn(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else { return }
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .coverVertical
        self.present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func chageBtn(_ sender: Any) {
    }
    
    
}
