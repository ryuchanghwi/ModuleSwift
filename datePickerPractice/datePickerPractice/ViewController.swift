//
//  ViewController.swift
//  datePickerPractice
//
//  Created by 류창휘 on 2022/01/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateTextField: UITextField!
    private let datePicker = UIDatePicker()
    private var diaryDate: Date? //데이트를 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDatePicker()
        // Do any additional setup after loading the view.
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged) //valueChanged 값이 바뀔 때마다 함수 호출
        self.dateTextField.inputView = self.datePicker //키보드가 아닌 datepicker가 표시됌
        self.datePicker.locale = Locale(identifier: "ko-KR") //한국어로 바꿔줌
    }
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmatter = DateFormatter()
        formmatter.dateFormat = "yyyy년 MM월 dd일(EEEE)"
        formmatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmatter.string(from: datePicker.date)
    }


}

