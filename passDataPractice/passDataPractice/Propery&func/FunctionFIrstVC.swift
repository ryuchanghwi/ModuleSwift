//
//  Property&funcFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

class FunctionFIrstVC: UIViewController {

    @IBOutlet weak var propertyFunctionTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    func passData(data: String) {
        self.propertyFunctionTextLabel.text = data
    }
    
    @IBAction func moveSecondVC(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "FunctionSecondVC") as? FunctionSecondVC else { return }
        vc.mainVC = self
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let delegationStoryboard = UIStoryboard.init(name: "Delegation", bundle: nil)
        guard let delegationVC = delegationStoryboard.instantiateViewController(identifier: "DelegationFirstVC") as? DelegationFirstVC else { return }
        delegationVC.modalPresentationStyle = .fullScreen
        present(delegationVC, animated: true, completion: nil)
    }
    
}
