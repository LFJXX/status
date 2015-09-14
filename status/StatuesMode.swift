//
//  StatuesMode.swift
//  status
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class StatuesMode: NSObject {
  
    var attitudes_count = String()
    var comments_count = String()
    var created_at = String()
    var idstr = String()

    var thumbnail_pic = String()
    var reposts_count = String()
    var source = String()
    var text = String()
    var pic_urls = NSArray()
    var user = User()
    
  
    
    
    func objceClassInArray()-> NSDictionary{
        
        return ["pic_urls":LFPhoto.classForCoder()];
        
    }
   
}
