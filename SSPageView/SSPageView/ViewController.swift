//
//  ViewController.swift
//  SSPageView
//
//  Created by 点创科技 on 18/2/28.
//  Copyright © 2018年 shangshuai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContentView()
    }
    fileprivate func setupContentView() {
   
        // 创建主题内容
        let style = SSTitleStyle()
        style.isScrollEnable = true
        style.isShowBottomLine = true;
        style.isNeedScale = true;
        let pageFrame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 20)
   
        let titles = ["热门", "呆萌", "高颜值", "好声音", "好声音燃舞蹈", "高颜值", "好声音","热门", "呆萌", "高颜值", "好声音", "好声音燃舞蹈", "高颜值", "好声音"]
        var childVcs = [UIViewController]()
        for type in titles {
            let anchorVc = UIViewController()
            anchorVc.view.backgroundColor=UIColor.randomColor()
            childVcs.append(anchorVc)
        }
        let pageView = SSPageView(frame: pageFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

