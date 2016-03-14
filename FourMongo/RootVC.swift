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

let scrollViewHeight = screenHeight - 64

class RootVC: UINavigationController {
    
    var mainScrollView:UIScrollView?
    //在该控制器下添加三个容器页面,高度需要去除导航栏64
    func addThreeSubContainer(){
        mainScrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight - 64))
        mainScrollView?.contentSize = CGSize(width: 3*screenWidth, height: screenHeight - 64)
        mainScrollView?.pagingEnabled = true
        mainScrollView?.showsHorizontalScrollIndicator = false
        mainScrollView?.showsVerticalScrollIndicator = false
        
        //1、添加第一个页面
        var profilePageView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: scrollViewHeight))
        mainScrollView?.addSubview(profilePageView)
        profilePageView.backgroundColor = UIColor.redColor() //
        
        //2、添加第二个页面（商品详细信息页面）
        var goodsInfoView = UIScrollView(frame: CGRect(x: screenWidth, y: 64, width: screenWidth, height: screenHeight - 64))
        goodsInfoView.contentSize = CGSize(width: 2*screenWidth, height: screenHeight - 64)
        mainScrollView?.addSubview(goodsInfoView)
        
        goodsInfoView.pagingEnabled = true
        goodsInfoView.showsHorizontalScrollIndicator = false
        goodsInfoView.showsVerticalScrollIndicator = false
        
        goodsInfoView.backgroundColor = UIColor.yellowColor() //
        
        //3、添加第三个页面（商品搜索）
        var searchPageView = UITableView(frame: CGRect(x: 2*screenWidth, y: 0, width: screenWidth, height: scrollViewHeight))
        mainScrollView?.addSubview(searchPageView)
        searchPageView.backgroundColor = UIColor.darkTextColor() //
        
        self.view.addSubview(mainScrollView!)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        addThreeSubContainer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

