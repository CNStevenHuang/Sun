//
//  StaffDetailTableViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/27.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class StaffDetailTableViewController: UITableViewController {

    @IBOutlet var _tableView: UITableView!
    
    var rows: Array<Dictionary<String,String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        getStaffInfoData();

    }
    
    func getStaffInfoData(){
        //网址
        let url = NSURL(string: "http://fp.kwesz.com.cn:8000/Test/GetStaffInfoJson?top=50&entrydatebegin=2007-01-01&status=在职".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!);//URL参数中如果有汉字、空格需要进行特殊处理否则，创建NSURL会返回nil
        //或stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet(charactersInString:"`#%^{}\"[]|\\<> ").invertedSet)!
        //会话配置
        let config=NSURLSessionConfiguration.defaultSessionConfiguration();
        //配置超时时间为10秒
        config.timeoutIntervalForRequest=10;
        //建立会话
        let session = NSURLSession(configuration: config);
        
        //会话的任务
        let task=session.dataTaskWithURL(url!, completionHandler: {(data, _, error) ->Void in
            
            //如果连接没有错误, 则处理数据
            if error == nil {
                if let jsonObject : AnyObject = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments){
                    if let json = jsonObject as? NSDictionary {
                        if let results = json.valueForKey("staffinfo") as? NSArray {
                            var array : Array<Dictionary<String,String>> = []
                            for result in results{
                                let dict = result as? NSDictionary
                                
                                array.append(["工号": (dict!["kweid"] as? String)!, "英文名": (dict!["nameen"] as? String)!, "中文名": (dict!["namecn"] as? String)!,"性别": (dict!["sex"] as? String)!]);
                            }
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.rows = array;
                                self._tableView.reloadData();
                            })
                        }
                    }
                }
                
            }
            
        })
        
        //执行任务
        task.resume();
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return rows.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellcontent", forIndexPath: indexPath)

        let dict:Dictionary<String,String> = rows[indexPath.row];
        
        (cell.contentView.viewWithTag(1) as! UILabel).text = dict["工号"];
        (cell.contentView.viewWithTag(2) as! UILabel).text = dict["英文名"];
        (cell.contentView.viewWithTag(3) as! UILabel).text = dict["中文名"];
        (cell.contentView.viewWithTag(4) as! UILabel).text = dict["性别"];

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
