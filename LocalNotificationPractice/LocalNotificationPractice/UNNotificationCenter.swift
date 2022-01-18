//
//  UNNotificationCenter.swift
//  LocalNotificationPractice
//
//  Created by 류창휘 on 2022/01/17.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        //The editable content for a notification.
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이에요"
        content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
        
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        //특정 시간에 활성화
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
    }
}
