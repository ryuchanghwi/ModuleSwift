//
//  ViewController.swift
//  bottomsheetPractice
//
//  Created by 류창휘 on 2021/12/27.
//

import UIKit
import PanModal

class ViewController: UIViewController {
    @IBOutlet weak var tableModalBtn: UIButton!
    @IBOutlet weak var halfModalBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad()")
    }
    @IBAction func onModalBtnClicked(_ sender: UIButton) {
        print("ViewController - onModalBtnClicked")
        
        switch sender {
        case tableModalBtn:
            print("테이블 모달버튼이 선택되었다.")
            
            let vc = UIStoryboard(name: "bottomsheet", bundle: nil).instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
            presentPanModal(vc)
        case halfModalBtn:
            print("하프 모달버튼이 선택되었다.")
        default: break
        }
    }
    

}

