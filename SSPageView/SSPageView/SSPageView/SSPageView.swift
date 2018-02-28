//
//  SSPageView.swift
//  SSPageView
//
//  Created by 点创科技 on 18/2/28.
//  Copyright © 2018年 shangshuai. All rights reserved.
//

import UIKit

class SSPageView: UIView {
    // MARK: 定义属性
    fileprivate var titles : [String]!
    fileprivate var style : SSTitleStyle!
    fileprivate var childVcs : [UIViewController]!
    fileprivate weak var parentVc : UIViewController!
    
    fileprivate var titleView : SSTitleView!
    fileprivate var contentView : SSContentView!
    
    // MARK: 自定义构造函数
    init(frame: CGRect, titles : [String], style : SSTitleStyle, childVcs : [UIViewController], parentVc : UIViewController) {
        super.init(frame: frame)
        
        assert(titles.count == childVcs.count, "标题&控制器个数不同,请检测!!!")
        self.style = style
        self.titles = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        parentVc.automaticallyAdjustsScrollViewInsets = false
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK:- 设置界面内容
extension SSPageView {
    fileprivate func setupUI() {
        let titleH : CGFloat = 44
        let titleFrame = CGRect(x: 0, y: 0, width: frame.width, height: titleH)
        titleView = SSTitleView(frame: titleFrame, titles: titles, style : style)
        titleView.delegate = self
        addSubview(titleView)
        
        let contentFrame = CGRect(x: 0, y: titleH, width: frame.width, height: frame.height - titleH)
        contentView = SSContentView(frame: contentFrame, childVcs: childVcs, parentViewController: parentVc)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.delegate = self
        addSubview(contentView)
    }
}


// MARK:- 设置SSContentView的代理
extension SSPageView : SSContentViewDelegate {
    func contentView(_ contentView: SSContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    func contentViewEndScroll(_ contentView: SSContentView) {
        titleView.contentViewDidEndScroll()
    }
}


// MARK:- 设置SSTitleView的代理
extension SSPageView : SSTitleViewDelegate {
    func titleView(_ titleView: SSTitleView, selectedIndex index: Int) {
        contentView.setCurrentIndex(index)
    }
}
