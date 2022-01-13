//
//  SegueFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/12.
//

import Foundation
import UIKit

class SegueFirstVC: UIViewController {
    @IBOutlet weak var segueTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SegueSecondVC {
            let segueVC = segue.destination as? SegueSecondVC
            segueVC?.text = self.segueTextField.text ?? ""
        }

    }
    
    

    @IBAction func PropertyFuncButton(_ sender: Any) {
        let functionStoryboarod = UIStoryboard.init(name: "function", bundle: nil)
        guard let functionVC = functionStoryboarod.instantiateViewController(identifier: "FunctionFIrstVC") as? FunctionFIrstVC else { return }
        functionVC.modalPresentationStyle = .fullScreen
        present(functionVC, animated: true, completion: nil)
    }
    
}
