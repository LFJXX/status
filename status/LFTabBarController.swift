//
//  LFTabBarController.swift
//  status
//
//  Created by apple on 15/8/25.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFTabBarController: UITabBarController ,LFTabBarDelegate{
//  var items = NSArray();
  var items: [(UITabBarItem)]! = []
    override func viewDidLoad() {
        super.viewDidLoad()

        [self .addChildVC()];
        [self.addTabBar()];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTabBar(){
    
        let tabbar = LFTabBar(frame:self.tabBar.bounds)
        
        tabbar.items = self.items;
        tabbar.delegate = self
//        self.tabBar.removeFromSuperview()
        
        self.tabBar.addSubview(tabbar)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for view in self.tabBar.subviews{
            
            if !view .isKindOfClass(LFTabBar){
                view .removeFromSuperview()
            }
        }
        
    }
    

    func  addChildVC(){
        let homeVc = LFHomeController()
        self.addOneChildViewController(homeVc, title: "首页", image: "tabbar_home", seleImage: "tabbar_home_selected")
        let messageVc = LFMessageController()
        self.addOneChildViewController(messageVc, title: "消息", image: "tabbar_message_center", seleImage: "tabbar_message_center_selected")
        
        let discoverVc = LFDiscoverController()
        self.addOneChildViewController(discoverVc, title: "发现", image: "tabbar_discover", seleImage: "tabbar_discover_selected")
        
        
        let mineVc = LFMineController()
        self.addOneChildViewController(mineVc, title: "我的", image: "tabbar_profile", seleImage: "tabbar_profile_selected")
   
    }
    
    func addOneChildViewController(VC:UIViewController,title:String,image:String,seleImage:String){
        let nav = LFNavigationController(rootViewController:VC)
        VC.view.backgroundColor = UIColor.whiteColor()
        VC.tabBarItem.image = UIImage(named:image)
        VC.tabBarItem.selectedImage = UIImage(named:seleImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        VC.title = title
        self .addChildViewController(nav)
        self.items.append(VC.tabBarItem)
        
    }
    // 代理的方法
    func tabbarDidClick(UIView: LFTabBar,index:Int) {
        
        self.selectedIndex = index
    }
    
    

}
