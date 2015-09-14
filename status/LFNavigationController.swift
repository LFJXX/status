//
//  LFNavigationController.swift
//  status
//
//  Created by apple on 15/8/17.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let image = UIImage(named: "navigationbar_background") 
//        UINavigationBar.appearance().setBackgroundImage(image?.stretchableImageWithLeftCapWidth(1, topCapHeight: 92), forBarMetrics:.Default)
       
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        let count = self.viewControllers.count;
        if (count > 0) {
           
            let leftbtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 64))
            leftbtn .setImage(UIImage(named: "navigationbar_back"), forState: UIControlState.Normal)
            leftbtn.setImage(UIImage(named: "navigationbar_back_highlighted"), forState: UIControlState.Highlighted)
            leftbtn.addTarget(self, action: "leftClick", forControlEvents: UIControlEvents.TouchUpInside)
           viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbtn)

            let Y = UIScreen.mainScreen().bounds.size.width - 30
            let rightbtn = UIButton(frame: CGRect(x: 0, y:Y, width: 30, height: 64))
            rightbtn .setImage(UIImage(named: "navigationbar_more"), forState: UIControlState.Normal)
            rightbtn.setImage(UIImage(named: "navigationbar_more_highlighted"), forState: UIControlState.Highlighted)
            rightbtn.addTarget(self, action: "rightClick", forControlEvents: UIControlEvents.TouchUpInside)
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
       
    }
    
    func leftClick(){
        self.popViewControllerAnimated(true)
    }
    
    func rightClick(){
        self.popToRootViewControllerAnimated(true)
    }

}
