//
//  LFTabBarButton.swift
//  status
//
//  Created by apple on 15/8/26.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFTabBarButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        let W :CGFloat = UIScreen.mainScreen().bounds.size.width/5
        let imageVW :CGFloat = 30
        let imageVH : CGFloat = 30
        let X = (W - imageVW)*0.5
        let titleH = self.bounds.height - imageVH
        self.imageView?.frame = CGRectMake(X, 0, imageVW, imageVH)
        self.titleLabel?.frame = CGRectMake(0, imageVH, W, titleH)
//        self.titleLabel?.backgroundColor = UIColor.grayColor()
        
    }
}
