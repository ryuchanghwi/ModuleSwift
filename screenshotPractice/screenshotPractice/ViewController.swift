//
//  ViewController.swift
//  screenshotPractice
//
//  Created by 류창휘 on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var screenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func screeshotBtn(_ sender: Any) {
        let screenshot = self.screenView.takeScreenshot()
        
        //detail view controller
        image = screenshot
        
        
    }
    
}

extension UIView {
    func takeScreenshot() -> UIImage {
        
        //begin
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        
        if image != nil {
            return image!
        }
        
        return UIImage()
    }
}
