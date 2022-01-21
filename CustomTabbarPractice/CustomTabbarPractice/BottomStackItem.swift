//
//  BottomStackItem.swift
//  CustomTabbarPractice
//
//  Created by 류창휘 on 2022/01/21.
//

import Foundation

class BottomStackItem {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String,
         image: String,
         isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}
