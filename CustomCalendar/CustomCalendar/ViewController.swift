//
//  ViewController.swift
//  CustomCalendar
//
//  Created by 류창휘 on 2022/02/08.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var selectedDate = Date() //현재 날짜
    let dateFormatter = DateFormatter()
    
    
//    var totalSquares = [String]()
    var totalSquares = [Date]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        setMonthView()
        
        print(selectedDate)//미국 시간
        
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm"
                
        dateFormatter.locale = Locale(identifier: "ko_KR") //한국시간
        print(dateFormatter.string(from: selectedDate))
        
        print(CalendarHelper().calendar)

    }
    

    
    func setMonthView() {
        totalSquares.removeAll()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        print(daysInMonth, "daysInMonth")
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        print(firstDayOfMonth, "firstDayOfMonth")
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        print(startingSpaces, "startingSpaces")
        
        var count: Int = 1
        
        while (count <= 42) {
            if (count <= startingSpaces || count - startingSpaces > daysInMonth) {
                totalSquares.append("")
            } else {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate) //몇 월 + 몇 년도 출력
        calendarCollectionView.reloadData()
        
    }
    

    @IBAction func previousMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    @IBAction func newMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
//        cell.dayOfMonth.text = totalSquares[indexPath.item]
        let date = totalSquares[indexPath.item]
        cell.dayOfMonth.text = String(CalendarHelper().daysInMonth(date: date))
        
//        if (date == selectedDate) {
//            cell.backgroundColor = UIColor.systemRed //선택된 ㅅ
//        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }

    
    
    // 위 아래 간격 Linef
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 옆 간격 Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = calendarCollectionView.frame.width / 7
        let height = calendarCollectionView.frame.height / 7
        
        let size = CGSize(width: width, height: height)
        return size
    }
}



