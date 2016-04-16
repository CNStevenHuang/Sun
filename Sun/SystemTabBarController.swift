//
//  SystemTabBarController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/24.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class SystemTabBarController: UITabBarController {

    @IBAction func closeSystem(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "提示", message: "您确定要退出系统吗?", preferredStyle: UIAlertControllerStyle.Alert);
        let action1 = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default){
            (action: UIAlertAction!) ->Void in
        let myStoryBoard = self.storyboard;
        let anotherView:MainTabBarController = myStoryBoard?.instantiateViewControllerWithIdentifier("maintabbar") as! MainTabBarController;
        self.presentViewController(anotherView, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: nil);
        alertController.addAction(action1);
        alertController.addAction(action2);
        self.presentViewController(alertController, animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
