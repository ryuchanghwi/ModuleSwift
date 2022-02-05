//
//  ViewController.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/24.
//

import UIKit
import FSCalendar

var selectedDate = Date()
var formatter = DateFormatter()


//let mySelectedData = [Data]()

class ViewController: UIViewController, UITextViewDelegate, mySelectedDate {
    
    
    func clickedDate(data: Date) {
        selectedDate = data
    }
    
    
    

    var date: String!
    var diaryList = [String]()
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var diaryTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarSetting()

    
        calendarView.delegate = self
        calendarView.dataSource = self
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
        
        
        formatter.dateFormat = "yyyy-MM-dd"
        self.dateLabel.text = formatter.string(from: calendarView.today!)
        
        
        
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calendarView.reloadData()
        diaryTableView.reloadData()
    }

    
    func selectedDataCount() {
        let mySelectedData = [Data]()
        if mySelectedData.count > 2 {
            return
        }
    }


    
    func calendarSetting() {
        //월요일이 맨 왼쪽으로 오게 하는 설정
        calendarView.firstWeekday = 2
        //배경색 변경
        calendarView.backgroundColor = UIColor.systemTeal
        //선택한 날짜색 변경
        calendarView.appearance.selectionColor = UIColor.purple
        //오늘 날짜색 변경
//        calendarView.appearance.todayColor = UIColor.white
        //여러개 선택 가능
        calendarView.allowsMultipleSelection = false
        //스와이프 동작으로 다중 선택
        calendarView.swipeToChooseGesture.isEnabled = false
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
        
        calendarView.appearance.eventDefaultColor = .black
        
        
        //다중 선택
        calendarView.allowsMultipleSelection = true
        
        //드래그 동작을 다중 선택
        calendarView.swipeToChooseGesture.isEnabled = true
        
        //스크롤 작동
//        calendarView.scrollEnabled = true
        
        
    }
    
    
    
    @IBAction func moveButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        vc.text = self.dateLabel.text ?? ""
        present(vc, animated: true, completion: nil)
    }
    
 
    
    
}








extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        diaryTableView.reloadData() //날짜 선택할 때 해당 리스트 리로드 하기
        
        
//        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
//        // 날짜를 원하는 형식으로 저장하기 위한 방법입니다.
//        modalPresentView.date = formatter.string(from: date)
//        self.present(modalPresentView, animated: true, completion: nil)
        
        
        diaryTableView.reloadData()
        formatter.dateFormat = "yyyy-MM-dd"
        print("Date Selected == \(formatter.string(from: date))")
        self.dateLabel.text = formatter.string(from: date)
        
        
        
        print(selectedDate, "???")
        
        
        
    }
    
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "yyyy-MM-dd"
//        print("Date De-Selected == \(formatter.string(from: date))")
    }

    
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        return true
    }
    
    
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//
//    }

    
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        switch formatter.string(from: date) {
        case formatter.string(from: calendar.today! + 1):
            return UIImage(named: "heart")
        default:
            return nil
        }
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        switch formatter.string(from: date) {
        case formatter.string(from: calendarView.today!):
            return "오늘"

        default:
            return nil
        }
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch formatter.string(from: date) {
        case formatter.string(from: calendarView.selectedDate ?? calendarView.today!):
//            print(calendarView.selectedDate ?? calendarView.today! , "선택된 날짜")
            return "선택됨"
        default:
            return nil
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        switch formatter.string(from: date) {
        case formatter.string(from: calendarView.today!):
            return 1
        default:
            return 0
        }
    }
    
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        if calendarView.selectedDates.count > 3 {
            return false
        } else {
            return true
        }
    }
    
    

    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventForDate(date: selectedDate).count
        print(Event().eventForDate(date: selectedDate).count, "카운트")
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell", for: indexPath) as? DiaryTableViewCell else { return UITableViewCell() }
//        cell.myDiaryLabel.text = diaryList[indexPath.row]
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell") as! DiaryTableViewCell
        let event = Event().eventForDate(date: selectedDate)[indexPath.row]
        cell.myDiaryLabel.text = event.name
        print(cell)
        print(event)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
