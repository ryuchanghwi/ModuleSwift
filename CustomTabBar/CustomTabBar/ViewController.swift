//
//  ViewController.swift
//  CustomTabBar
//
//  Created by 류창휘 on 2022/01/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewforTab: UIView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        designableTabBar()
        
        // 시간 간격을 주어 화면이 전부 채워지지 않는 이슈 해결
        DispatchQueue.main.async {
            self.forhome()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent //UIStatusBarStyleLightContent    어두운 배경을 고려한 하얀색 텍스트
    }
    
    func forhome() {
        guard let Search = self.storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
        contentView.addSubview(Search.view)
        Search.didMove(toParent: self)
    }

    
    func designableTabBar() {
        viewforTab.layer.cornerRadius = viewforTab.frame.size.height / 2 //둥글게 처리하기
        viewforTab.clipsToBounds = true
    }
    @IBAction func onClickedTabBar(_ sender: UIButton) {
        let tag = sender.tag
        print(tag)
        if tag == 1 {
            guard let Home = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
            contentView.addSubview(Home.view)
            Home.didMove(toParent: self)
            
        } else if tag == 2 {
            guard let Search = self.storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
            contentView.addSubview(Search.view)
            Search.didMove(toParent: self)
            
        } else if tag == 3 {
            guard let Camera = self.storyboard?.instantiateViewController(identifier: "CameraViewController") as? CameraViewController else { return }
            contentView.addSubview(Camera.view)
            Camera.didMove(toParent: self)
            
        } else if tag == 4 {
            guard let Profile = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else { return }
            contentView.addSubview(Profile.view)
            Profile.didMove(toParent: self)
            
        }
    }
    
}

