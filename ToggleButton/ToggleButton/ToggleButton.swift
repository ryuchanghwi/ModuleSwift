//
//  ToggleButton.swift
//  ToggleButton
//
//  Created by 류창휘 on 2022/02/07.
//

import Foundation
import UIKit

class ToggleButton: UIButton {
    
    //
    var isActivated : Bool = false
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("ToggleButton - awakeFromNib() called")
    }
    
    func setState(_ newValue: Bool) {
        print("ToggleButton - setState() called / newValue: \(newValue)")
        
        // 1. 현재 버튼의 상태 변경
        self.isActivated = newValue
        // 2. 변경된 상태에 따른 이미지 변경
        let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(.systemPink).withRenderingMode(.alwaysOriginal)
        let normalImage =  UIImage(systemName: "heart")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal)
        
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
    }
}
