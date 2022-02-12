//
//  TabBarItem.swift
//  SnapKitPractice
//
//  Created by 류창휘 on 2022/02/11.
//

import Foundation
import UIKit

enum TarBarItem: CaseIterable{ //CaseIterable을 사용하면 Collection과 같이 enum의 값들을 순회할 수 있도록 함
    case home
    case trend
    case broadcasting
    case search
    case drawer
    
    //
    
    var vc: UIViewController {
        switch self { //self를 선정하면 자동으로 case가 채워짐
        case .home:
            return UINavigationController(rootViewController: ViewController())
        case .trend:
            return TrendViewController()
        case .broadcasting:
            return BroadcastingViewController()
        case .search:
            return SearchViewController()
        case .drawer:
            return DrawerViewController()
        }
    }
    
    
    var title: String { //네비게이션바의 타이틀 지정
        switch self {
        case .home:
            return "홈"
        case .trend:
            return "트렌드"
        case .broadcasting:
            return "방송"
        case .search:
            return "검색"
        case .drawer:
            return "서랍"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "홈")!
        case .trend:
            return UIImage(named: "홈")!
        case .broadcasting:
            return UIImage(named: "홈")!
        case .search:
            return UIImage(named: "홈")!
        case .drawer:
            return UIImage(named: "홈")!
        }
    }
    
}
