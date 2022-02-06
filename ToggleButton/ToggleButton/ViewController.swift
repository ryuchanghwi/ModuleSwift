//
//  ViewController.swift
//  ToggleButton
//
//  Created by 류창휘 on 2022/02/07.
//

import UIKit


class Feed {
    var isFavorate: Bool = false
}

class ViewController: UIViewController {
    @IBOutlet weak var heartButton: ToggleButton!
    
    var heartBtnAction: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

