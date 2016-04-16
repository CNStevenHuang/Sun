//
//  XingZhengCollectionViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/26.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class XingZhengCollectionViewController: UICollectionViewController {

    let cols : Array<Dictionary<String,String>> = [
        ["name":"人事","image":"png-0191"],["name":"考勤","image":"png-0192"],["name":"固定资产","image":"png-0193"],["name":"培训","image":"png-0194"],["name":"办公物品","image":"png-0195"],["name":"文书","image":"png-0196"],["name":"档案","image":"png-0197"],["name":"会议","image":"png-0198"],["name":"书刊","image":"png-0199"],["name":"规章制度","image":"png-0200"],["name":"订车","image":"png-0201"],["name":"企业文化","image":"png-0202"],["name":"活动","image":"png-0203"],["name":"安全卫生","image":"png-0204"],["name":"IOS","image":"png-0205"],["name":"公告","image":"png-0190"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        let image = UIImage(named:"xingzheng.png")?.imageWithRenderingMode(UIImageRenderingMode.Automatic);
        let selimage = UIImage(named:"xingzheng.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        self.tabBarItem.title = "行政";
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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cols.count;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: cols[indexPath.item]["image"]!) ;
        (cell.contentView.viewWithTag(2) as! UILabel).text = cols[indexPath.item]["name"];
        return cell;
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        if(cols[indexPath.item]["name"]! == "人事"){
            let myStoryBoard = self.storyboard;
            let anotherView:SystemDetailNaviController = myStoryBoard?.instantiateViewControllerWithIdentifier("systemdetailnavi") as! SystemDetailNaviController;
            self.presentViewController(anotherView, animated: true, completion: nil)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
