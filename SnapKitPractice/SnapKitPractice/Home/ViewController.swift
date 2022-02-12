//
//  ViewController.swift
//  SnapKitPractice
//
//  Created by 류창휘 on 2022/02/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    //스냅킷 사용 없이 오토레이아웃 만들기
    
    lazy var scrollView = { () -> UIScrollView in
        let superScrollView = UIScrollView()
        superScrollView.backgroundColor = UIColor.black
        return superScrollView
    }()
    
    lazy var topView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var melonButton = { () -> UIButton in
        let button = UIButton()
        button.setImage(UIImage(named: "홈"), for: .normal)
        button.setTitle("설정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var melonBarButton = { [self] () -> UIBarButtonItem in
        let barButton = UIBarButtonItem(customView: melonButton)
        navigationController?.navigationItem.rightBarButtonItem = barButton
        return barButton
    }()
    
//    private func loadRightBarItem() {
//        let logoutBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(handleEditBtn))
//        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
//    }
    
    lazy var voucherButton = { () -> UIButton in
        let button = UIButton()
        button.setImage(UIImage(named: "국탕찌개"), for: .normal)
        return button
    }()
    
    lazy var settingButton = { () -> UIButton in
        let button = UIButton()
        button.setImage(UIImage(named: "과자초콜릿"), for: .normal)
        return button
    }()
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //UI 설정 메소드
        configureUI()

    }


}

private extension ViewController {
    func configureUI() {
        self.view.addSubview(scrollView)
        self.view.addSubview(topView)
        self.view.addSubview(melonButton)
        self.view.addSubview(voucherButton)
//        self.view.addSubview(settingButton)
//        self.view.addSubview(melonBarButton)
  
        
        //스크롤 뷰
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide) //스크롤뷰가 표현될 영역
        }
        
        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.scrollView)
            make.height.equalTo(100)
        }
        
        melonButton.snp.makeConstraints { make in
            make.leading.equalTo(self.topView).inset(20)
            make.centerY.equalTo(self.topView)
            make.height.width.equalTo(50)
        }
        
        voucherButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.settingButton).inset(60)
            make.centerY.equalTo(self.topView)
            make.height.width.equalTo(50)
            
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.topView).inset(20)
            make.centerY.equalTo(self.topView)
            make.height.width.equalTo(50)
        }
        
        
    }
}



import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
    
    @available(iOS 13.0, *)
    struct SnapkitVCRepresentable_PreviewProvider: PreviewProvider {
        static var previews: some View {
            Group {
                ViewControllerRepresentable()
                    .ignoresSafeArea()
                    .previewDisplayName("Preview")
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            }
        }
    }
}

//Opt + Cmd + 엔터 프리뷰 켜기
