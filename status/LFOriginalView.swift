//
//  LFOriginalView.swift
//  status
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFOriginalView: UIView {
    var iconView = UIImageView()
    var timeView = UILabel()
    var sourceView = UILabel()
    var nameView = UILabel()
    var textView = UILabel()
    var imageView = UIImageView()
    
    var statusFrame = LFStatusFrame(){
        
        didSet(_statusFrame){
            self.iconView.frame = statusFrame.iconFrame
            self.timeView.frame = statusFrame.timeFrame
            self.sourceView.frame = statusFrame.sourceFrame
            self.nameView.frame = statusFrame.nameFrame
            self.textView.frame = statusFrame.textFrame
            self.imageView.frame = statusFrame.imageFrame
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var iconView = UIImageView()
        self.iconView = iconView
        self.addSubview(self.iconView)
        
        var timeView = UILabel()
        self.timeView = timeView
        self.addSubview(self.timeView)
        
        var sourceView = UILabel()
        self.sourceView = sourceView
        self.addSubview(self.sourceView)
        
        var nameView = UILabel()
        self.nameView = nameView
        self.addSubview(self.nameView)
        
        var textView = UILabel()
        self.textView = textView
        self.addSubview(self.textView)
        
        var imageView = UIImageView()
        self.imageView = imageView
        self.addSubview(self.imageView)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

 

}
