//
//  ClosureFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

class ClosureFirstVC: UIViewController {

    @IBOutlet weak var delegateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closureButton(_ sender: Any) {
        guard let closureVC = storyboard?.instantiateViewController(identifier: "ClosureSecondVC") as? ClosureSecondVC else { return }
        closureVC.modalPresentationStyle = .fullScreen
        present(closureVC, animated: true, completion: nil)
        
        closureVC.didClick = { [weak self] (writedText : String) in
            guard let self = self else { return }
            self.delegateLabel.text = writedText
        }

    }
    
    
    @IBAction func moveToCombine(_ sender: Any) {
        let combineStoryboard = UIStoryboard.init(name: "Combine", bundle: nil)
        guard let combineVC = combineStoryboard.instantiateViewController(identifier: "CombineFirstVC") as? CombineFirstVC else { return }
        combineVC.modalPresentationStyle = .fullScreen
        present(combineVC, animated: true, completion: nil)
    }
    
}
