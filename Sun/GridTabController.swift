//
//  GridTabController.swift
//  Sun
//
//  Created by huang chunlu on 16/3/1.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class GridTabController: UITabBarController {

    @IBAction func back(sender: UIBarButtonItem) {
        let myStoryBoard = self.storyboard;
        let anotherView:SystemDetailNaviController = myStoryBoard?.instantiateViewControllerWithIdentifier("systemdetailnavi") as! SystemDetailNaviController;
        self.presentViewController(anotherView, animated: true, completion: nil)
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
