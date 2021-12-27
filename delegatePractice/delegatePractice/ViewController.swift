//
//  ViewController.swift
//  delegatePractice
//
//  Created by 류창휘 on 2021/12/27.
//

import UIKit

protocol LabelChangeDelegate {
    func onChange()
}

protocol tableViewDelegate {
    func tableViewValueChanged()
}


class ViewController: UIViewController {
    //테이블뷰
    var stringArr = [String]()
    @IBOutlet weak var changedTableView: UITableView!
    
    
    @IBOutlet weak var uiLabel: UILabel!
    var changeDelegate: LabelChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //테이블뷰
        self.changedTableView.delegate = self
        self.changedTableView.dataSource = self
    }
    
    @IBAction func didTap(_ sender: Any) {
        let secondVC = UIStoryboard.init(name: "second", bundle: nil)
        guard let second = secondVC.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        second.mainVC = self
        present(second, animated: true, completion: nil)
    }
    
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: changedTableView)
        guard let indexpath = changedTableView.indexPathForRow(at: point) else { return }
        stringArr.remove(at: indexpath.row)
        changedTableView.beginUpdates()
        changedTableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        changedTableView.endUpdates()
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
        cell.lblName.text = stringArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
