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
        //最底层创建毛玻璃
        var boottomImageView = UIImageView(frame: self.view.frame)
        boottomImageView.image = UIImage(named: "backGroundIMG")
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = boottomImageView.frame
        effectView.alpha = 0.5
        boottomImageView.addSubview(effectView)
        self.view.addSubview(boottomImageView)
        
        mainScrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight - 64))
        mainScrollView?.contentSize = CGSize(width: 3*screenWidth, height: screenHeight - 64)
        mainScrollView?.pagingEnabled = true
        mainScrollView?.showsHorizontalScrollIndicator = false
        mainScrollView?.showsVerticalScrollIndicator = false
        
        //1、添加第一个页面
        var profilePageView = UIScrollView(frame: self.view.frame)
        profilePageView.contentSize = CGSize(width: screenWidth, height: screenHeight + 40)
        //profilePageView.backgroundColor = UIColor(red: 35, green: 57, blue: 66, alpha: 1)
        mainScrollView?.addSubview(profilePageView)
        
        var maxY = one_addSubView1(profilePageView)
        maxY = one_addSubView2(profilePageView,startMaxY: maxY)
        addGuessYouLike(profilePageView, startMaxY: maxY)
        
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

    /**
     添加第一排视图
     
     - parameter containerView: 父容器
     
     - returns: 返回最后添加完最下面一个视图的最底部的frame值
     */
    func one_addSubView1(containerView:UIView)->CGFloat{
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth/5 + 20))
        //用户头像
        let img = UIImageView(frame: CGRect(x: 10, y: 10, width: screenWidth/5, height: screenWidth/5))
        img.layer.cornerRadius = screenWidth/10
        img.layer.borderWidth = CGFloat(0.5)
        img.layer.borderColor = UIColor.redColor().CGColor
        
        let usrName = UILabel(frame: CGRect(x: img.frame.maxX + 10, y: 10, width: 2*screenWidth/5, height: screenWidth/5 + 20))
        button.addSubview(img)
        button.addSubview(usrName)
        //button.backgroundColor = UIColor(red: 72/255, green: 45/255, blue: 45/255, alpha: 1.0)
        button.addTarget(self, action: Selector("usrInformationBtnClk"), forControlEvents: UIControlEvents.TouchUpInside)
        
        var bottomView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth/5 + 20))
        bottomView.addSubview(button)
        bottomView.image = UIImage(named: "backGroundImg3")
        containerView.addSubview(bottomView)
        
        var separateLine = UIImageView(frame: CGRect(x: 0, y: bottomView.frame.maxY, width: screenWidth, height: 10 ))
        containerView.addSubview(separateLine)
        separateLine.image = UIImage(named: "backGroundImg2")
        
        return button.frame.maxY
    }
    /**
     添加第二排视图
     
     - parameter containerView: 父容器
     - parameter startMaxY:返回最后添加完最下面一个视图的最底部的frame值
     */
    func one_addSubView2(containerView:UIView,var startMaxY:CGFloat)->CGFloat{
        startMaxY = startMaxY + 10
        
        let  w = (screenWidth - 60 )/3
        let  h = w
        let length = CGFloat(10)
        
        var subView1 = UIView(frame: CGRect(x: 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView1.backgroundColor = UIColor.redColor()
        var subView2 = UIView(frame: CGRect(x: subView1.frame.maxX + 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView2.backgroundColor = UIColor.redColor()
        var subView3 = UIView(frame: CGRect(x: subView2.frame.maxX + 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView3.backgroundColor = UIColor.redColor()
        
        
        startMaxY = subView3.frame.maxY + 10
        var subView4 = UIView(frame: CGRect(x: 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView4.backgroundColor = UIColor.redColor()
        var subView5 = UIView(frame: CGRect(x: subView1.frame.maxX + 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView5.backgroundColor = UIColor.redColor()
        var subView6 = UIView(frame: CGRect(x: subView2.frame.maxX + 10, y: startMaxY, width: (screenWidth - 40 )/3, height: (screenWidth - 60 )/3))
        subView6.backgroundColor = UIColor.redColor()
        
        containerView.addSubview(subView1)
        containerView.addSubview(subView2)
        containerView.addSubview(subView3)
        containerView.addSubview(subView4)
        containerView.addSubview(subView5)
        containerView.addSubview(subView6)
        
        var separateLine = UIImageView(frame: CGRect(x: 0, y: subView6.frame.maxY, width: screenWidth, height: 10 ))
        containerView.addSubview(separateLine)
        separateLine.image = UIImage(named: "backGroundImg2")
        
        return subView6.frame.maxY
    }

    /**
     猜你喜欢
     
     - parameter containerView: containerView description
     - parameter startMaxY:     startMaxY description
     */
    func addGuessYouLike(containerView:UIView,var startMaxY:CGFloat){
        var view = UIView(frame:CGRect(x: 0, y: startMaxY + 10, width: screenWidth, height: screenWidth/5 + 20))
        containerView.addSubview(view)
        view.backgroundColor = UIColor.redColor()
        
    }

    func usrInformationBtnClk(){
        NSLog("用户信息查看")
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

