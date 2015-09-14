//
//  LFAuthViewController.swift
//  status
//
//  Created by apple on 15/8/27.
//  Copyright (c) 2015年 xyb100. All rights reserved.
//

import UIKit


class LFAuthViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var url :NSURL = NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=2475767494&redirect_uri=http://www.baidu.com")!
        let request :NSURLRequest = NSURLRequest(URL: url)
        let webVc = UIWebView(frame: UIScreen.mainScreen().bounds)
        webVc.delegate = self
        webVc.loadRequest(request)
        self.view.addSubview(webVc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        var urlstr = request.URL?.absoluteString
        let str = NSString(string: "http://www.baidu.com/?code=")
        
//        let range:Range = urlstr!.rangeOfString(str as String)!
        if (urlstr!.rangeOfString(str as String) != nil){
            let range:Range = urlstr!.rangeOfString(str as String)!
            let code = urlstr?.substringFromIndex(range.endIndex)
            println(urlstr)
            println(code)
            self.accessTokenWithCode(code!)
            return false
            
        }
        
        return true
    }
    
//    func accessTokenWithCode(code:String){
//        var param = Dictionary<String, AnyObject>()
//        param["client_id"] = "2475767494"
//        param["client_secret"] = "8c8f8eb219b3d974cc1bbc32559be81d"
//        param["grant_type"] = "authorization_code"
//        param["code"] = code as NSString
//        param["redirect_uri"] = "http://www.baidu.com"
//
//        var request = HTTPTask()
//        request.POST("https://api.weibo.com/oauth2/access_token", parameters:param , completionHandler: {(response: HTTPResponse) in
//            
//            if let err = response.error {
//                println("error: \(err.localizedDescription)")
//                return //also notify app of failure as needed
//            }
//            if let res: AnyObject = response.responseObject {
//                println("response: \(res)")
//                let data:NSData = response.responseObject as! NSData
//                let dic: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary;
//            }
//        })
//        
//      
//
//    }
    
    func accessTokenWithCode(code:String){
        
//        var param = NSMutableDictionary()
        var param = Dictionary<String, AnyObject>()
        param["client_id"] = "2475767494"
        param["client_secret"] = "8c8f8eb219b3d974cc1bbc32559be81d"
        param["grant_type"] = "authorization_code"
        param["code"] = code as NSString
        param["redirect_uri"] = "http://www.baidu.com"
        
        var jsonData : NSData = NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted, error: nil)!
        var url :NSURL = NSURL(string: "https://api.weibo.com/oauth2/access_token")!
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 60)
        request.addValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = jsonData
       NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respose, data, error) -> Void in
        
        if (error != nil) {
        
        }else{
            
        }
        println(data)
        println(respose)
//        let tabVc = LFTabBarController()
//        UIApplication.sharedApplication().keyWindow?.rootViewController = tabVc
        }
        
       
    }
    

}
