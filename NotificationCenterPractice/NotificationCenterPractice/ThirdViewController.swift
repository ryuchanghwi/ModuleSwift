//
//  ThirdViewController.swift
//  NotificationCenterPractice
//
//  Created by 류창휘 on 2022/01/05.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
    }
    
    //키보드 입력 완료 버튼을 눌렀을때 키보드 사라지게 하기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //화면 아무곳이나 터치 해도 키보드가 사라지게 하기
    override func  touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        <#code#>
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
