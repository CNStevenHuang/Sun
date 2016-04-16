//
//  MainCenterViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/21.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

var MainCenter = MainCenterViewController();

class MainCenterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var _tableView: UITableView!
    
    var _page: Int = 1;
    var _size: Int = 15;
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self._size;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cellid = "cell1";
        
        if(indexPath.row % 5 == 0){
            cellid = "cell2";
        }
        
        if(indexPath.row == 0){
            cellid = "cell3";
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellid, forIndexPath: indexPath) as UITableViewCell;
        
        if(cellid == "cell1"){
            var name = "png-";
            let index = indexPath.row + 1 + (self._page - 1)*self._size;
            let string0: String = "0000" + "\(index)";
            let start = string0.startIndex.advancedBy(string0.characters.count - 4)
            name += string0.substringFromIndex(start)
            
            (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: "\(name).png");
            (cell.contentView.viewWithTag(2) as! UILabel).text = "标题:\(indexPath.row + 1 + (self._page - 1)*self._size)"
            (cell.contentView.viewWithTag(3) as! UILabel).text = "内容:\(indexPath.row + 1 + (self._page - 1)*self._size)";
        }else if(cellid == "cell2"){
            (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: "png-0191.png");
            (cell.contentView.viewWithTag(2) as! UIImageView).image = UIImage(named: "png-0192.png");
            (cell.contentView.viewWithTag(3) as! UIImageView).image = UIImage(named: "png-0193.png");
            (cell.contentView.viewWithTag(4) as! UIImageView).image = UIImage(named: "png-0194.png");
            (cell.contentView.viewWithTag(5) as! UIImageView).image = UIImage(named: "png-0195.png");
        }else if(cellid == "cell3"){
            (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: "top.jpg");
        }
        
//        let image = UIImageView(frame: CGRectMake(4,4,48,43));
//        image.image = UIImage(named: "\(name).png");
//        
//        cell.contentView.addSubview(image);
//        
//        let title = UILabel(frame: CGRectMake(64,4,311,21));
//        title.text = "标题:\(indexPath.row + 1 + (self._page - 1)*self._size)"
//        title.font = UIFont.boldSystemFontOfSize(CGFloat(17));
//        
//        cell.contentView.addSubview(title);
//        
//        let content = UILabel(frame: CGRectMake(64,18,311,29));
//        content.text = "内容:\(indexPath.row + 1 + (self._page - 1)*self._size)";
//        content.font = UIFont.systemFontOfSize(CGFloat(11));
//        
//        cell.contentView.addSubview(content);

        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if(indexPath.row == 0){
            return 170;
        }
        return 65;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        MainCenter = self;
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
