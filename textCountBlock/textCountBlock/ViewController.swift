//
//  ViewController.swift
//  textCountBlock
//
//  Created by 류창휘 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextView.delegate = self
    }


}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = myTextView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        countLabel.text = String(changedText.count)
        print(changedText.count)
        return changedText.count < 10
        
    }
}


