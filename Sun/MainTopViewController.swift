//
//  MainTopViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/21.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class MainTopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var _collectionView: UICollectionView!
    
    let _menus : Array<String> = ["头条","福田","坪山","前海","石岩","广州","东莞","中山","珠海","惠州"];
   
    var _page: Int = 1;
    var _size: Int = 15;
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return _menus.count;
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell:UICollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        let button: UIButton = cell.contentView.viewWithTag(1) as! UIButton
        button.setTitle(_menus[indexPath.item], forState: UIControlState.Normal)
        button.addTarget(self,action:Selector("menuclick:"),forControlEvents:.TouchUpInside)
        
        if(_page == 1 && indexPath.item == 0){
            button.titleLabel?.font = UIFont.boldSystemFontOfSize(CGFloat(15));
        }
        
        return cell;
    }
    
    func menuclick(button: UIButton){
        switch(button.titleLabel?.text!){
        case "头条"?:
            self._page = 1;
            break;
        case "福田"?:
            self._page = 2;
            break;
        case "坪山"?:
            self._page = 3;
            break;
        case "前海"?:
            self._page = 4;
            break;
        case "石岩"?:
            self._page = 5;
            break;
        case "广州"?:
            self._page = 6;
            break;
        case "东莞"?:
            self._page = 7;
            break;
        case "中山"?:
            self._page = 8;
            break;
        case "珠海"?:
            self._page = 9;
            break;
        case "惠州"?:
            self._page = 10;
            break;
        default:
            self._page = 0;
            break;
        }

        MainCenter._page = self._page;
        MainCenter._tableView.reloadData();
        
        for item in self._collectionView.subviews{
            let cell: UICollectionViewCell = item as! UICollectionViewCell;
            let button1: UIButton = cell.contentView.viewWithTag(1) as! UIButton
            button1.titleLabel?.font = UIFont.boldSystemFontOfSize(CGFloat(12));
        }
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(CGFloat(15));
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
