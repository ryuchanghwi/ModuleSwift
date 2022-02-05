//
//  ViewController.swift
//  CountingText
//
//  Created by 류창휘 on 2022/02/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textview에 delegate 상속
        myTextView.delegate = self
        
        //처음 화면이 로드되었을 때 플레이스 홀더처럼 보이게끔 만들어주기
        myTextView.text = "플레이스홀더입니다."
        myTextView.textColor = UIColor.lightGray
        countLabel.text = "0/100"
        
        
        //텍스트뷰가 구분되게끔 테두리를 주도록 하겠습니다.
        myTextView.layer.borderWidth = 1
        myTextView.layer.borderColor = UIColor.black.cgColor

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextView.resignFirstResponder()
    }

}

extension ViewController: UITextViewDelegate {
    
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if myTextView.text.isEmpty {
            myTextView.text =  "플레이스홀더입니다"
            myTextView.textColor = UIColor.lightGray
        }

    }

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if myTextView.textColor == UIColor.lightGray {
            myTextView.text = nil
            myTextView.textColor = UIColor.black

        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = myTextView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        countLabel.text = "\(changedText.count)/100"
        
        if changedText.count < 10 {
            myTextView.textColor = UIColor.red
        } else {
            myTextView.textColor = UIColor.blue
        }
        
        
        
        return true
    }
    
    
    


}
