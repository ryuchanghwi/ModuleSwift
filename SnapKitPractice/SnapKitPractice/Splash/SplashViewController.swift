//
//  SplashViewController.swift
//  SnapKitPractice
//
//  Created by 류창휘 on 2022/02/11.
//

import Foundation
import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하기", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapLoginBUtton), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //레이아웃 설정 함수
        configureUI()
    }
    
    
    
    
    @objc func didTapLoginBUtton() {
        let tabBarController = UITabBarController()
        let vcs = TarBarItem.allCases.map { item -> UIViewController in
            let vc = item.vc
            vc.tabBarItem = UITabBarItem(title: item.title, image: item.icon, selectedImage: item.icon)
            return vc
        }
        tabBarController.viewControllers = vcs
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true)
    }
}


private extension SplashViewController {
    func configureUI() {
        self.view.addSubview(loginButton)
        
        
        loginButton.snp.makeConstraints { make in
            
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
            
        }
    }
}


import SwiftUI
struct SplashViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave this empty
    }
    
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        SplashViewController()
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
