//
//  ViewController.swift
//  TagListGit
//
//  Created by 류창휘 on 2021/12/01.
//

import UIKit
import TagListView

class ViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var myTagListView: TagListView!
    @IBOutlet weak var addTagBtn: UIButton!
    @IBOutlet weak var userInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTagListView.delegate = self
        
        addTagBtn.addTarget(self, action: #selector(addTag), for: .touchUpInside)
        
        userInputTextField.delegate = self
    }
    
    @objc fileprivate func addTag() {
        print("ViewController - addTag() called")
        let userInput = userInputTextField.text
        if let input = userInput {
            
            if input.count > 1 {
                myTagListView.addTag(input)
                userInputTextField.text = nil
            } else {
                let alert = UIAlertController(title: "내용을 입력해주세요!", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
        
    }
    //태그를 눌렀을 때
    
    /// 태그를 눌렀을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트뷰
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("ViewController - tagPressed() called / title: \(title)")
        // 해당 태그뷰의 트루 폴스 값을 토글 시켜줌
        tagView.isSelected.toggle()
    }
    
    /// 태그 삭제버튼이 클릭 되었을 떄
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트뷰
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
    }

}

