//
//  ViewController.swift
//  pagerViewPractice
//
//  Created by 류창휘 on 2022/01/05.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    @IBOutlet weak var myPagerView: FSPagerView! {
        didSet {
            // 페이저뷰에 셀을 등록한다.
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            // 무한 스크롤 설정
            self.myPagerView.isInfinite = true
            // 자동 스크롤
            self.myPagerView.automaticSlidingInterval = 4.0 //4초마다 스크롤
        }
        
    }
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    
    
    
    @IBOutlet weak var myPageControl: FSPageControl! {
        didSet{
            self.myPageControl.numberOfPages = self.imageNames.count
            self.myPageControl.contentHorizontalAlignment = .center
            self.myPageControl.itemSpacing = 16
            self.myPageControl.interitemSpacing = 16
        }
    }
    
    fileprivate let imageNames = ["splashImg1.png", "splashImg2.png", "splashImg3.png", "splashImg4.png"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myPagerView.dataSource = self
        self.myPagerView.delegate = self
        
        //라운드
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
        
    }
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        print("ViewController - onLeftBtnClicked() called")
        self.myPageControl.currentPage = self.myPageControl.currentPage - 1
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        print("ViewController - onRightBtnClicked() called")
        //+1 을 해나가면 outOfRange 에러 발생
        if(self.myPageControl.currentPage == self.imageNames.count - 1) {
            self.myPageControl.currentPage = 0
        } else {
            self.myPageControl.currentPage = self.myPageControl.currentPage + 1
        }
//        self.myPageControl.currentPage = self.myPageControl.currentPage + 1
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    
    
    //MARK: - FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    //각 셀에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.textLabel?.contentMode = .scaleAspectFit
        return cell
    }
    
    //MARK: - FSPagerView delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPageControl.currentPage = pagerView.currentIndex
    }

    //선택되었을 때 하이라이트 해제
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }

}

