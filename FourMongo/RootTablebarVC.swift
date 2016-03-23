//
//  RootTablebarVC.swift
//  FourMongo
//
//  Created by 默默 on 16/3/23.
//  Copyright © 2016年 MoMo IOS. All rights reserved.
//

import UIKit

class RootTablebarVC: UITabBarController {

    var firstVC = FirstVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.viewControllers = [firstVC]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



}
