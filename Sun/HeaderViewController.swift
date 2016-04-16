//
//  HeaderViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/3/1.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var _collectionView: UICollectionView!
    
    let cols : Array<Dictionary<String,String>> = [
        ["name":"工号"],["name":"英文名"],["name":"中文名"],["name":"性别"]
    ]
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.cols.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell:UICollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        (cell.contentView.viewWithTag(1) as! UILabel).text = self.cols[indexPath.item]["name"]
        return cell;
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
