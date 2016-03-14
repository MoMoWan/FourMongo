//
//  ViewController.swift
//  FourMongo
//
//  Created by 默默 on 16/3/13.
//  Copyright © 2016年 MoMo IOS. All rights reserved.
//

import UIKit


let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height

class RootVC: UIViewController {
    
    
    //底层ScrollView容器
    @IBOutlet weak var scrollView: UIScrollView!
    //首页宽度
    @IBOutlet weak var profilePageWidth: NSLayoutConstraint!
    @IBOutlet weak var goodsPageWidth: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //横向可以滚动三个页面，高度需要去除导航栏64
        scrollView.contentSize = CGSize(width: screenWidth*3, height: screenHeight - 64)
        profilePageWidth.constant = screenWidth
        goodsPageWidth.constant = screenWidth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

