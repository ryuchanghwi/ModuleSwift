//
//  ViewController.swift
//  FloatingActionButton
//
//  Created by 류창휘 on 2022/01/25.
//

import UIKit
import JJFloatingActionButton

class ViewController: UIViewController {
    let actionButton = JJFloatingActionButton()
    let secondButton = JJFloatingActionButton() // 커스텀 하기
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        actionButtonSetting()

        // last 4 lines can be replaced with
        // actionButton.display(inViewController: self)
    }

    
    
    
    
    func actionButtonSetting() {
        let img = UIImage()
        actionButton.buttonColor = UIColor.orange
        
        
        actionButton.itemAnimationConfiguration = .slideIn(withInterItemSpacing: 40)
        actionButton.buttonAnimationConfiguration = .transition(toImage: UIImage(systemName: "heart.fill") ?? img)

        actionButton.addItem(title: "좋아요", image: UIImage(systemName: "hand.thumbsup.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "좋아요👍"
        }

        actionButton.addItem(title: "하트", image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "하트💕"
        }

        actionButton.addItem(title: "휴지통", image: UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "휴지통🗑"
        }

        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
    

}



//MARK: - Custom
//actionButton.handleSingleActionDirectly = false
//actionButton.buttonDiameter = 65
//actionButton.overlayView.backgroundColor = UIColor(white: 0, alpha: 0.3)
//actionButton.buttonImage = UIImage(named: "Dots")
//actionButton.buttonColor = .red
//actionButton.buttonImageColor = .white
//actionButton.buttonImageSize = CGSize(width: 30, height: 30)
//
//actionButton.buttonAnimationConfiguration = .transition(toImage: UIImage(named: "X"))
//actionButton.itemAnimationConfiguration = .slideIn(withInterItemSpacing: 14)
//
//actionButton.layer.shadowColor = UIColor.black.cgColor
//actionButton.layer.shadowOffset = CGSize(width: 0, height: 1)
//actionButton.layer.shadowOpacity = Float(0.4)
//actionButton.layer.shadowRadius = CGFloat(2)
//
//actionButton.itemSizeRatio = CGFloat(0.75)
//actionButton.configureDefaultItem { item in
//    item.titlePosition = .trailing
//
//    item.titleLabel.font = .boldSystemFont(ofSize: UIFont.systemFontSize)
//    item.titleLabel.textColor = .white
//    item.buttonColor = .white
//    item.buttonImageColor = .red
//
//    item.layer.shadowColor = UIColor.black.cgColor
//    item.layer.shadowOffset = CGSize(width: 0, height: 1)
//    item.layer.shadowOpacity = Float(0.4)
//    item.layer.shadowRadius = CGFloat(2)
//}
//
//actionButton.addItem(title: "Balloon", image: UIImage(named: "Baloon")) { item in
//    // Do something
//}
//
//let item = actionButton.addItem()
//item.titleLabel.text = "Owl"
//item.imageView.image = UIImage(named: "Owl")
//item.buttonColor = .black
//item.buttonImageColor = .white
//item.buttonImageColor = CGSize(width: 30, height: 30)
//item.action = { item in
//    // Do something
//}
