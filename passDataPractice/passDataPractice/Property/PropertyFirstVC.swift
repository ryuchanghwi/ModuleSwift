//
//  PropertyFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/12.
//

import Foundation
import UIKit

class PropertyFirstVC: UIViewController {
    @IBOutlet weak var propertyTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func properryButton(_ sender: Any) {
        
        guard let propertyVC = UIStoryboard(name: "PropertySecond", bundle: nil).instantiateViewController(identifier: "PropertySecondVC") as? PropertySecondVC else { return }
        propertyVC.text = self.propertyTextField.text ?? ""

        
        self.navigationController?.pushViewController(propertyVC, animated: true)
        //화면 전환과 함께 텍스트 필드에 입력한 값을 넘김

    }
    @IBAction func SegueVCButton(_ sender: Any) {
        guard let segueVC = UIStoryboard(name: "Segue", bundle: nil).instantiateViewController(identifier: "SegueFirstVC") as? SegueFirstVC else { return }
        self.navigationController?.pushViewController(segueVC, animated: true)
    }
    
}
