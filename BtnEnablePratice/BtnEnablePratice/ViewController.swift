//
//  ViewController.swift
//  BtnEnablePratice
//
//  Created by 류창휘 on 2022/01/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDatePicker()
        self.configureInputField()
        
        //로드시 버튼 비활성화
        self.confirmButton.isEnabled = false
        
    }
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }


    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.dateTextField.inputView = self.datePicker
        self.datePicker.locale = Locale(identifier: "ko-KR")
    }
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko-KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        //키보드로 입력하지 않기때문에 editingChanged가 적용되지 않음
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //빈 화면을 눌렀을 때 키보드 사라짐
    }
    
    //등록버튼 활성화 여부 함수
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) &&  !self.contentsTextView.text.isEmpty
    }
}


extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) { //textview가 입력될따마다 호출, 내용이 채워져있음을 판단
        self.validateInputField() //내용이 입력될때마다 등록버튼 활성화여부 판단
    }
}
