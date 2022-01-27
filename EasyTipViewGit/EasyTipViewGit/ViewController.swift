//
//  ViewController.swift
//  EasyTipViewGit
//
//  Created by 류창휘 on 2022/01/26.
//

import UIKit
import EasyTipView

class ViewController: UIViewController {
    var preferences = EasyTipView.Preferences()
    
    @IBOutlet var conterBtn: UIButton!
    @IBOutlet var topLeadingBtn: UIButton!
    @IBOutlet var toptrailingBtn: UIButton!
    @IBOutlet var bottomLeadingBtn: UIButton!
    @IBOutlet var bottomTrailingBtn: UIButton!
    
    lazy var centerToolTip = EasyTipView(text: "")
    lazy var topLeadingToolTip = EasyTipView(text: "")
    lazy var topTrailingToolTip = EasyTipView(text: "")
    lazy var bottomLeadingToolTip = EasyTipView(text: "")
    lazy var bottomTrailingToolTip = EasyTipView(text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onBtnClicked(sender: UIButton) {
        print("ViewController - onBtnClicked() called")
        switch sender {
        case self.conterBtn:
            print("센터 버튼이 클릭되었다.")
            //툴팁 설정
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = .gray
            preferences.drawing.arrowPosition = .top
            preferences.animating.dismissDuration = 2 //2초 뒤에 사라짐
            preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: 100) //사라지는 방법
            
            centerToolTip = EasyTipView(text: "안녕하세요", preferences: preferences, delegate: self)
            centerToolTip.show(forView: self.conterBtn, withinSuperview: self.view)
        case self.topLeadingBtn:
            print("탑 리딩 버튼이 클릭되었다.")
            //툴팁 설정
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = .gray
            preferences.drawing.arrowPosition = .right
            
            topLeadingToolTip = EasyTipView(text: "나타났다", preferences: preferences, delegate: self)
            topLeadingToolTip.show(forView: self.topLeadingBtn, withinSuperview: self.view)
        case self.toptrailingBtn:
            print("탑 트레일링 버튼이 클릭되었다.")
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = .gray
            preferences.drawing.arrowPosition = .bottom
            
            topTrailingToolTip = EasyTipView(text: "오른쪽", preferences: preferences, delegate: self)
            topTrailingToolTip.show(forView: self.toptrailingBtn, withinSuperview: self.view)
        case self.bottomLeadingBtn:
            print("바텀 리딩 버튼이 클릭되었다.")
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = .gray
            preferences.drawing.arrowPosition = .left
        case self.bottomTrailingBtn:
            print("바텀 트레일링 버튼이 클릭되었다.")
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = .gray
            preferences.drawing.arrowPosition = .any
        default:
            print("default")
        }
    }

}

extension ViewController: EasyTipViewDelegate {
    func easyTipViewDidTap(_ tipView: EasyTipView) {
        print("툴팁이 클립됨")
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        print("툴팁이 닫힘")
    }

    
}
