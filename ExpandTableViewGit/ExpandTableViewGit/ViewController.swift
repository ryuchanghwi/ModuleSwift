//
//  ViewController.swift
//  ExpandTableViewGit
//
//  Created by 류창휘 on 2021/12/01.
//

import UIKit
import ExpyTableView

class ViewController: UIViewController, ExpyTableViewDelegate, ExpyTableViewDataSource, MyCellDelegate {
    
    

    

    

    
    @IBOutlet weak var ExpandTableView: ExpyTableView!
    
    
    //테이블 뷰의 데이터
    //이차원 배열
    let contentArray = [
        ["섹션1 - 하나", "섹션1 - 둘"],
        ["섹션2 - 하나", "섹션2 - 둘"],
        ["섹션3 - 하나", "섹션3 - 둘", "섹션3 - 셋", "섹션3 - 넷"],
        ["섹션3 - 하나", "섹션3 - 둘"],
        ["섹션3 - 하나", "섹션3 - 둘"]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ExpandTableView.delegate = self
        ExpandTableView.dataSource = self
    }

    
    
    //MARK: - ExpyTableView 델리게이트
    // 열리고 닫히고 상태가 변경될 때
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        //어떤 섹션인지 체크
        print("changeForSection: \(section)")
        switch state {
        case .willExpand:
            print("펼쳐질거다 / .willExpand")
        case .willCollapse:
            print("닫힐거다 / .willCollapse")
        case .didExpand:
            print("펼쳐짐 /.didExpand")
        case .didCollapse:
            print("닫힘 / .willCollapse")
            
        }
    }
    
    //MARK: - ExpyTableView 데이터소스
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        //true로 설정하면 펼칠 수 있음
        return true
    }
    
    // 펼치는 섹션, 헤더셀 설정
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyHeaderCell") as! MyHeaderCell
        cell.titleLabel.text = "섹션 \(section + 1)입니다."
        let bgView = UIView()
        bgView.backgroundColor = .white
        cell.selectedBackgroundView = bgView
        
        cell.sectionIndex = section
        cell.delegate = self
        return cell
    }
    
    // 각 세션에 들어갈 row의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray[section].count + 1
    }
    
    // 펼쳐진 셀을 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDetailCell") as! MyDetailCell
        cell.titleLabel.text = (contentArray[indexPath.section])[indexPath.row - 1]
        return cell
    }
    
    
    // 섹션의 갯수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    //MARK: - MyCellDelegate 메소드
    func didSwitchBtnClick(cell: MyHeaderCell) {
        print("ViewController - didSwitchBtnClick() called / cell.sectionIndex : \(cell.sectionIndex)")
        
        switch cell.mySwitch.isOn {
        case true:
            ExpandTableView.expand(cell.sectionIndex)
        case false:
            
            ExpandTableView.collapse(cell.sectionIndex)
        }
    }
}

class MyHeaderCell: UITableViewCell, ExpyTableViewHeaderCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImgView: UIImageView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    //이벤트 전달을 위한 델리겟
    weak var delegate : MyCellDelegate?
    
    var sectionIndex: Int = 0 {
        didSet {
            print("MyHeaderCell - sectionIndex disSet() : \(sectionIndex)")
        }
    }
    
    @IBAction func onMySwitchValueChanged(_ sender: UISwitch) {
        print("MyHeaderCell - onMySwitchValueChaged() called / sender : \(sender.isOn)")
        //델리겟을 통해 스위치의 값이 변경되었다고 알리기
        delegate?.didSwitchBtnClick(cell: self)
    }
    
    //셀을 다시 사용하는지 여부
    //해당 헤더 셀의 상태를 알 수 있다.
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        print("MyHeaderCell - state : \(state) / cellReuse: \(cellReuse)")
        switch state {
        case .willExpand:
            print("펼쳐질 예정")
            self.mySwitch.setOn(true, animated: !cellReuse)
            self.arrowDowm(animated: !cellReuse)
        case .willCollapse:
            print("접힐 예정")
            self.mySwitch.setOn(false, animated: !cellReuse)
            self.arrowRight(animated: !cellReuse)
        case .didExpand:
            print("펼쳐짐")
        case .didCollapse:
            print("접혀짐")
        }
    }
    
    //화살표 아래로 회전
    fileprivate func arrowDowm(animated: Bool) {
        // animated == true - 0.3
        // animated == false - 0
        // animated == true ? 0.3 : 0
        UIView.animate(withDuration: (animated ? 0.3 : 0), animations:  {
            //애니메이션 효과
            self.arrowImgView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2))
        })
    }
    
    //원래 상태로 돌리기
    fileprivate func arrowRight(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0), animations:  {
            self.arrowImgView.transform = CGAffineTransform(rotationAngle: 0)
        })
    }
}


class MyDetailCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
}


//델리게이트 패턴
protocol MyCellDelegate: AnyObject {
    func didSwitchBtnClick(cell: MyHeaderCell)
}
