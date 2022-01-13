//
//  NotiFirstVC.swift
//  passDataPractice
//
//  Created by 류창휘 on 2022/01/13.
//

import Foundation
import UIKit

let notificationName = "LabelNotification"

class NotiFirstVC: UIViewController {
    @IBOutlet weak var notiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData(_:)), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    @objc func loadData(_ notification : NSNotification) {
        if let text = notification.object as? String  {
            notiLabel.text = text
        }
    }
    @IBAction func notiButton(_ sender: Any) {
        let notiVC = storyboard?.instantiateViewController(identifier: "NotiSecondVC") as! NotiSecondVC
        notiVC.modalPresentationStyle = .fullScreen
        present(notiVC, animated: true, completion: nil)
    }
    

}
