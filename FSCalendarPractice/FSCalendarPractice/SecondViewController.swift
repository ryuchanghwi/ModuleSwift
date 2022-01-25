//
//  SecondViewController.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/25.
//

import Foundation
import UIKit
import FSCalendar

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var date: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = date
    }
}
