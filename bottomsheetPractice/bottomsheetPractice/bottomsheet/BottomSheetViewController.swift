//
//  BottomSheetViewController.swift
//  bottomsheetPractice
//
//  Created by 류창휘 on 2021/12/27.
//

import Foundation
import UIKit
import PanModal

class BottomSheetViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BottomSheetViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
}
