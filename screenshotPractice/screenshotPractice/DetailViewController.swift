//
//  DetailViewController.swift
//  screenshotPractice
//
//  Created by 류창휘 on 2022/01/28.
//

import Foundation
import UIKit

var image: UIImage = UIImage()

class DetailViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.image = image
    }
}
