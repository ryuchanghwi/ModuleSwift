//
//  ViewController.swift
//  NotificationCenterPractice
//
//  Created by 류창휘 on 2022/01/05.
//


//textfield에서 값을 입력하였을 때 값을 3개의 뷰컨트롤러에서 받아서 변경

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //노티피케이션이라는 방송 수신기를 장착한다.
//        NotificationCenter.default.addObserver(self, selector: #selector(<#T##@objc method#>), name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }

    @IBAction func goSecondVCBtn(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else { return }
        secondVC.modalTransitionStyle = .coverVertical
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
    }
    @IBAction func goThirdVCBtn(_ sender: Any) {
        guard let thirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") else { return }
        thirdVC.modalTransitionStyle = .coverVertical
        thirdVC.modalPresentationStyle = .fullScreen
        self.present(thirdVC, animated: true, completion: nil)
    }
    
}

