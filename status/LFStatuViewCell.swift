//
//  LFStatuViewCell.swift
//  status
//
//  Created by apple on 15/8/3.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFStatuViewCell: UITableViewCell {
    
    var iconView = UIImageView()
    var titleLable = UILabel()
    var subtitleLable = UILabel()
//    var model = StatuesMode()
    var cellH : CGFloat = 0
//  self.model = StatuesMode()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var model:StatuesMode{
    
        didSet{
           
        self.conflicData()
            
        }
    }

  
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.model = StatuesMode()
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        if (!self.isEqual(nil)){
        
         
            self .addsubViews();
//            self.model = StatuesMode()
//            [self .conflicData()];
        }
    
  
  }
     required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func addsubViews(){
        
        iconView = UIImageView()
//        iconView.backgroundColor = UIColor.yellowColor()
        self.contentView.addSubview(iconView)
        
        titleLable = UILabel()
        titleLable.font = UIFont.systemFontOfSize(18)
        self.contentView.addSubview(titleLable)
        
        subtitleLable = UILabel()
        subtitleLable.font = UIFont.systemFontOfSize(16)
        self.contentView.addSubview(subtitleLable)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margix:CGFloat = 10.0
        
        iconView.frame = CGRect(x:margix, y:margix,width:30.0,height: 30.0)
        titleLable.frame = CGRect(x:CGRectGetMaxX(iconView.frame)+5,y: margix, width:150.0, height:30.0)
        
        let size =  CGSize(width: CGFloat(self.bounds.size.width), height:CGFloat(MAXFLOAT))
        let Lsize = self .textSizeWithFont(self.model.text, font: UIFont.systemFontOfSize(16), constrainedToSize: size)
        subtitleLable.frame = CGRect(x:margix, y:CGRectGetMaxY(titleLable.frame),width:self.bounds.size.width - 2 * margix, height:Lsize.height)
        print(Lsize.height);
  
        subtitleLable.numberOfLines = 0
        
        cellH = CGRectGetMaxY(subtitleLable.frame)
        
//        self.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: cellH)
        var frame = self.frame
//        frame.origin.x = 0
        frame.size.height = cellH
        self.frame = frame
        
    }
    
 
    
    // 根据文本的大小,调整
    func textSizeWithFont(text: NSString, font: UIFont, constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if CGSizeEqualToSize(size, CGSizeZero) {
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            textSize = text.sizeWithAttributes(attributes as [NSObject : AnyObject])
        } else {
            let option = NSStringDrawingOptions.UsesLineFragmentOrigin
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName)
            let stringRect = text.boundingRectWithSize(size, options: option, attributes: attributes as [NSObject : AnyObject], context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
    

    func conflicData(){
    
        let str1 = "ee_"
        var num = arc4random_uniform(34)
        let imageName = str1 + String(num)
        iconView.image = UIImage(named: imageName)
        subtitleLable.text = self.model.text
        titleLable.text = self.model.user.name
        
//        subtitleLable.text = ""
//        titleLable.text = self.model.user.name
        var frame = self.frame
        //        frame.origin.x = 0
        frame.size.height = cellH
        self.frame = frame
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        
        return cellH
    }

    
    

}
