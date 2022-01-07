//
//  SecondViewController.swift
//  NotificationCenterPractice
//
//  Created by 류창휘 on 2022/01/05.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var SecondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goFirstVCBtn(_ sender: Any) {
        guard let VC = self.storyboard?.instantiateViewController(identifier: "ViewController") else { return }
        VC.modalPresentationStyle = .fullScreen
        VC.modalTransitionStyle = .coverVertical
        self.present(VC, animated: true, completion: nil)
    }
    
    @IBAction func goThirdVCBtn(_ sender: Any) {
        guard let ThirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") else { return }
        ThirdVC.modalPresentationStyle = .fullScreen
        ThirdVC.modalTransitionStyle = .coverVertical
        self.present(ThirdVC, animated: true, completion: nil)
    }
}
