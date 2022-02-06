//
//  SecondViewController.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/25.
//

import Foundation
import UIKit
import FSCalendar


protocol mySelectedDate {
    func clickedDate(data: Date)
}


class SecondViewController: UIViewController {
    
    var text: String = ""
    var delegate: mySelectedDate?
    var diaryDate: Date!
    
    
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var diaryTextField: UITextField!
    
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondDateLabel.text = text
        
        
    }

    


    
    @IBAction func saveBtn(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventList.count
        newEvent.name = diaryTextField.text
        newEvent.myDate = selectedDate
        eventList.append(newEvent)
        dismiss(animated: true, completion: nil)
        print(newEvent.name, "이벤트 네임")
        print(newEvent)
        
        
    }
}
