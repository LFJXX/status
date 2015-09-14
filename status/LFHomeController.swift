//
//  ViewController.swift
//  status
//
//  Created by apple on 15/7/22.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit

class LFHomeController: UITableViewController {
    var statusArray = NSArray()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationController?.navigationBar.barTintColor = UIColor .orangeColor()
        
//        self.view.backgroundColor = UIColor .redColor()
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "id")
        
//        self.title = "123"
        
        let filePath = NSBundle.mainBundle() .pathForResource("status.plist", ofType: nil)
        var dict = NSDictionary(contentsOfFile:filePath!)
        var value:AnyObject? = dict!.objectForKey("statuses")
        
        statusArray = StatuesMode.objectArrayWithKeyValuesArray(value! as![[String : AnyObject]])

      
        
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statusArray.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCellWithIdentifier("id") as! UITableViewCell
            
            
        var cell = LFStatuViewCell(style: .Subtitle, reuseIdentifier: "id")
           
        var row = indexPath.row as Int
        var u:StatuesMode = statusArray[row] as! StatuesMode
            cell.model = u

        return cell;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
        return 200
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVc = LFDetailViewController()
       

        self.navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
}

