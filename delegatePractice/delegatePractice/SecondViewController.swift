//
//  SecondViewController.swift
//  delegatePractice
//
//  Created by 류창휘 on 2021/12/27.
//

import UIKit



class SecondViewController: UIViewController, LabelChangeDelegate {
    func onChange() {
        mainVC?.uiLabel.text = labelTextField.text
    }
    
    func tableOnChange() {
        
    }
     
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var tableTextField: UITextField!
    
    var tableViewDataList : [tableViewData] = []
    
    var stringArr = [String]()
    
    var mainVC : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainVC?.changeDelegate = self

   
    }
    @IBAction func labelTapButton(_ sender: Any) {
        onChange()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func tableTapButton(_ sender: Any) {
        if let txt = tableTextField.text, !txt.isEmpty {
            self.mainVC?.stringArr.insert(txt, at: 0)
            mainVC?.changedTableView.beginUpdates()
            mainVC?.changedTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            mainVC?.changedTableView.endUpdates()
            tableTextField.text = nil
            self.dismiss(animated: true, completion: nil)
        }
    }

}
