//
//  LFStatusFrame.swift
//  status
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFStatusFrame: NSObject {

    var iconFrame:CGRect = CGRect()
    var nameFrame:CGRect = CGRect()
    var timeFrame:CGRect = CGRect()
    var sourceFrame:CGRect = CGRect()
    var textFrame:CGRect = CGRect()
    var imageFrame:CGRect = CGRect()
    var orginalFrame:CGRect = CGRect()
    
    var relayNameFrame:CGRect = CGRect()
    var relayTextFrame:CGRect = CGRect()
    var relayImageFrame:CGRect = CGRect()
    var relayFrame:CGRect = CGRect()
    
    var commentFrame:CGRect = CGRect()
    
    var statusModel = StatuesMode(){
    
        didSet(_statusModel){
        
            
        }
    }
}

