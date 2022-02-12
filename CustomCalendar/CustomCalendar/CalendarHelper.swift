//
//  CalendarHelper.swift
//  CustomCalendar
//
//  Created by 류창휘 on 2022/02/08.
//

import Foundation
import UIKit

class CalendarHelper {
    let calendar = Calendar.current //사용자의 현재 캘린더, 일반적으로 그냥 캘린더를 지칭 하는 듯
//    print(calendar)
    
    func plusMonth(date: Date) -> Date {
        //date(byAdding:value:to:wrappingComponents:)
        //특정 구성요소의 양을 지정된 날짜에 추가하여 계산한 날짜를 나타내는 새 날짜를 반환
        //다음 달 기능
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        //date(byAdding:value:to:wrappingComponents:)
        //특정 구성요소의 양을 지정된 날짜에 추가하여 계산한 날짜를 나타내는 새 날짜를 반환
        //이전 달 기능
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL" // 몇 월을 출력
        return dateFormatter.string(from: date)
    }
    
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" //년도를 출력
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
        //한달이 몇일인지 나타내는 함수
    }
    
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!

        //날짜를 표시
        //셀 각각에 날짜를 표시하는 기능
        
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
        //ex) 2022-01-31 15:00:00 +0000 firstDayOfMonth
        //dateComponents 달력 시간대를 사용하여 날짜의 모든 날짜 구성요소를 반환

    }
    
    func weekDay(date: Date) -> Int  {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
        //3 startingSpaces

    }

}
