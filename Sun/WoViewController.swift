//
//  WoViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/26.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class WoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named:"wo.png")?.imageWithRenderingMode(UIImageRenderingMode.Automatic);
        let selimage = UIImage(named:"wo.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        self.tabBarItem.title = "我";
        self.tabBarItem.image = image;
        self.tabBarItem.selectedImage = selimage;
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
