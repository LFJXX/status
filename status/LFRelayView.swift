//
//  LFRelayView.swift
//  status
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFRelayView: UIView {
    var nameFrame = UILabel()
    var textView = UILabel()
    var imageView = UIImageView()

    var statusFrame = LFStatusFrame(){
    
        didSet(_statusFrame){
        
            self.nameFrame.frame = statusFrame.relayNameFrame
            self.textView.frame = statusFrame.relayTextFrame
            self.imageView.frame = statusFrame.relayImageFrame
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        var titleView = UILabel()
        self.nameFrame = titleView
        self.addSubview(self.nameFrame)
        
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
