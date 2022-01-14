//
//  CombineFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit
import Combine

class CombineFirstVC : UIViewController {
    @IBOutlet weak var combineLabel: UILabel!
    
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveSecondVC(_ sender: Any) {
        let combineVC = storyboard?.instantiateViewController(identifier: "CombineSecondVC") as! CombineSecondVC
        combineVC.modalPresentationStyle = .fullScreen
        present(combineVC, animated: true, completion: nil)
        
        combineVC.didClickSubject.sink { writedText in
            self.combineLabel.text = writedText
        }.store(in: &subscriptions)
        
    }
    
    @IBAction func moveToNoti(_ sender: Any) {
        let NofiStoryboard = UIStoryboard.init(name: "Noti", bundle: nil)
        guard let NotiVC = NofiStoryboard.instantiateViewController(identifier: "NotiFirstVC") as? NotiFirstVC else { return }
        NotiVC.modalPresentationStyle = .fullScreen
        present(NotiVC, animated: true, completion: nil)
    }
}

