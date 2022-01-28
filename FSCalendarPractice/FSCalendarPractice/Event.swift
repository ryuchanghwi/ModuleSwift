//
//  Event.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/28.
//

import Foundation
import UIKit

var eventList = [Event]()

class Event {
    var id: Int!
    var name: String!
    var myDate: Date!
    
    func eventForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in daysEvents {
            daysEvents.append(event)
        }
        return daysEvents
    }
}
