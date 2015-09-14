//
//  LFStatusView.swift
//  status
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFStatusView: UIView {
    var originalView = LFOriginalView()
    var relayView = LFRelayView()
    var commentView = LFCommentView()
//    var statusFrame = LFStatusFrame()
 
    var statusFrame: LFStatusFrame = LFStatusFrame(){
        didSet(_statusFrame){
        
            self.originalView.statusFrame = statusFrame
            self.relayView.statusFrame = statusFrame
            self.commentView.statusFrame = statusFrame
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var originView = LFOriginalView()
        self.originalView = originView
        self.addSubview(self.originalView)

        var relayView = LFRelayView()
        self.relayView = relayView
        self.addSubview(self.relayView)
        
        var commentView = LFCommentView()
        self.commentView = commentView
        self.addSubview(self.commentView)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
