//
//  LFTabBar.swift
//  status
//
//  Created by apple on 15/8/26.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

protocol LFTabBarDelegate : NSObjectProtocol {
    
    func tabbarDidClick(UIView:LFTabBar,index:Int)
}

class LFTabBar: UIView {
    var delegate:LFTabBarDelegate?
    var addbtn = UIButton()
    var seleBtn = UIButton()
    
    var items: NSArray = [(UITabBarItem)](){
        didSet(anyOne) {
            for var i = 0 ; i<items.count ;i++ {
                let  item = items[i] as! UITabBarItem;
                let btn = LFTabBarButton(frame: CGRect())
                btn.setImage(item.image, forState: UIControlState.Normal)
                btn.setImage(item.selectedImage, forState: UIControlState.Selected)
                btn.setImage(item.selectedImage, forState: UIControlState.Highlighted)
                btn.setTitle(item.title, forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Selected)
                btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
                btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
               btn.titleLabel?.font = UIFont.systemFontOfSize(12)
                self .addSubview(btn)
                btn.tag = i
                btn.imageView?.textInputMode
                btn.titleLabel?.textAlignment = NSTextAlignment.Center
                if i == 0{
                
                    self .btnClick(btn)
                }
            }
            self.addbtn .setImage(UIImage(named: "tabbar_compose_icon_add"), forState:UIControlState.Normal)
            self.addbtn .setImage(UIImage(named: ""), forState:UIControlState.Selected)
            self.addbtn .setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:UIControlState.Highlighted)
            self.addbtn .setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:UIControlState.Normal)
            self.addbtn .setBackgroundImage(UIImage(named: "tabbar_compose_background_icon_close"), forState:UIControlState.Selected)
            self.addbtn .setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState:UIControlState.Highlighted)
            self.addbtn.addTarget(self, action: "addClick", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(self.addbtn)


        }
        

}
    

    
    func btnClick(btn:UIButton){
        self.seleBtn.selected = false
        self.seleBtn = btn
        btn.selected = true
        
        if((delegate) != nil){
        
            self.delegate?.tabbarDidClick(self,index: btn.tag)
        }
        
    }
    
    func addClick(){
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let count = self.subviews.count - 1
        for var i = 0 ; i < count ;i++ {
        
           
            let btn = self.subviews[i] as! UIButton
            let W = CGFloat( UIScreen.mainScreen().bounds.size.width/5)
            let H = CGFloat(self.bounds.size.height)
            var X = W * CGFloat(i)
            let Y = CGFloat(0)
            if i >= 2 {
                
                X = W * CGFloat(i+1)
            }
            btn.frame = CGRect(x: X, y: Y, width: W, height: H)
            
        }
        
        self.addbtn.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        self.addbtn.sizeToFit()
        
        
    }
    
}
