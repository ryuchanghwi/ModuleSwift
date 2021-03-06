//
//  DelegationFirsrtVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit



class DelegationFirstVC : UIViewController, LabelChangeDelegate {
    
    func onChange(data: String) {
        delegateLabel.text = data
    }
    
    @IBOutlet weak var delegateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(_ sender: Any) {

        guard let secondVC = storyboard?.instantiateViewController(identifier: "DelegationSecondVC") as? DelegationSecondVC else { return }
        
        secondVC.delegate = self
        
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func moveToclosureVC(_ sender: Any) {
        let closureStoryboard = UIStoryboard(name: "Closure", bundle: nil)
        guard let closureVC = closureStoryboard.instantiateViewController(identifier: "ClosureFirstVC") as? ClosureFirstVC else { return }
        closureVC.modalPresentationStyle = .fullScreen
        present(closureVC, animated: true, completion: nil)
    }
    
    
}
