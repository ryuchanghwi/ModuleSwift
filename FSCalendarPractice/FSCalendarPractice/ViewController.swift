//
//  ViewController.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/24.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {
    var formatter = DateFormatter()
    @IBOutlet weak var calendarView: FSCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarSetting()

        
        calendarView.delegate = self
        calendarView.dataSource = self
        
    }


    
    func calendarSetting() {
        //배경색 변경
        calendarView.backgroundColor = UIColor.systemTeal
        //선택한 날짜색 변경
        calendarView.appearance.selectionColor = UIColor.purple
        //오늘 날짜색 변경
        calendarView.appearance.todayColor = UIColor.white
        //여러개 선택 가능
        calendarView.allowsMultipleSelection = true
        //스와이프 동작으로 다중 선택
        calendarView.swipeToChooseGesture.isEnabled = true
        //스와이프 스크롤 작동 여부
        calendarView.scrollEnabled = true
        // 스와이프 스크롤 방향
        calendarView.scrollDirection = .vertical
        
        //선택된 날짜의 모서리 설정
        calendarView.appearance.borderRadius = 0
        
        //달력의 평일 날짜 색깔
        calendarView.appearance.titleDefaultColor = .black
        //달력의 토, 일 날짜 색깔
        calendarView.appearance.titleWeekendColor = .red
        //달력의 맨 위의 년도, 월의 색깔
        calendarView.appearance.headerTitleColor = .systemPink
        //달력의 요일 글자 색깔
        calendarView.appearance.weekdayTextColor = .orange
        
        //달력의 요일 글자 바꾸는 방법
        calendarView.locale = Locale(identifier: "ko_KR")
        
        //폰트 설정
        calendarView.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendarView.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18.0)
        calendarView.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)
    }
}


extension ViewController: FSCalendarDelegate {

    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        // 날짜를 원하는 형식으로 저장하기 위한 방법입니다.

        modalPresentView.date = formatter.string(from: date)
        self.present(modalPresentView, animated: true, completion: nil)
        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MMM-yyyy"
        print("Date De-Selected == \(formatter.string(from: date))")
    }

}


extension ViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}
