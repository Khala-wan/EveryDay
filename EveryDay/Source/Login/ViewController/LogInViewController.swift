//
//  LogInViewController.swift
//  EveryDay
//
//  Created by 万圣 on 2017/11/2.
//  Copyright © 2017年 万圣. All rights reserved.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {

//MARK: ---- lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpGuideView()
    }
//MARK: ---- public Method

//MARK: ---- event response

//MARK: ---- private method
    fileprivate final func setUpViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(bgView)
        bgView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(445/ScreenScale)
        })
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(bgView)
        })
        
        view.addSubview(iconView)
        iconView.snp.makeConstraints({
            $0.width.equalTo(80)
            $0.height.equalTo(80)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(96/ScreenScale)
        })
        
        view.layoutIfNeeded()
        view.addSubview(pageControl)
    }
    
    fileprivate final func setUpGuideView(){
        for index in 0...3{
            let x:CGFloat = CGFloat(index) * ScreenWidth
            let view:UIImageView = UIImageView(frame: CGRect(x: x, y: contentView.height - 65/ScreenScale - 51, width: ScreenWidth, height: 51))
            view.contentMode = .center
            view.image = UIImage(named:"GuideTitle\(index+1)")
            contentView.addSubview(view)
        }
    }
//MARK: ---- getter && setter
    fileprivate lazy var contentView:UIScrollView = {
        let view:UIScrollView = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: ScreenWidth * 4, height: view.height)
        return view
    }()
    
    fileprivate lazy var pageControl:SnakePageControl = {
        let pc:SnakePageControl = SnakePageControl(frame: CGRect(x: 0, y: contentView.frame.maxY - 30, width: 62, height: 4))
        pc.center.x = ScreenWidth * 0.5
        pc.pageCount = 4
        pc.indicatorRadius = 4
        pc.indicatorPadding = 10
        pc.activeTint = UIColor.white
        pc.inactiveTint = UIColor.white.withAlphaComponent(0.5)
        return pc
    }()
    
    fileprivate lazy var bgView:UIImageView = {
        let view:UIImageView = UIImageView()
        view.image = UIImage(named:"GuideBG")
        return view
    }()
    
    fileprivate lazy var iconView:UIImageView = {
        let view:UIImageView = UIImageView()
        view.image = UIImage(named:"GuideIcon")
        view.contentMode = .center
        return view
    }()
    
    fileprivate lazy var wxBtn:UIButton = {
        let btn:UIButton = UIButton()
        btn.backgroundColor = UIColor.getColor("00ac41")
        btn.settit
    }()
}

extension LogInViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        let progressInPage = scrollView.contentOffset.x - (page * scrollView.bounds.width)
        let progress = CGFloat(page) + progressInPage
        pageControl.progress = progress
    }
}

