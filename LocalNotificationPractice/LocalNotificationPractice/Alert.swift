//
//  Alert.swift
//  LocalNotificationPractice
//
//  Created by 류창휘 on 2022/01/17.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString //고유한 값
    let date: Date
    var isOn: Bool
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date) //let date 를 변환 해줌
    }
    var meridiem: String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a" //오전 오후
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from: date)
    }
    
}
