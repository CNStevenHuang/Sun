//
//  GridViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/3/1.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var _tableView: UITableView!
    
    var rows: Array<Dictionary<String,String>> = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return rows.count;
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell;
        
        let dict:Dictionary<String,String> = rows[indexPath.row];
        
        (cell.contentView.viewWithTag(1) as! UILabel).text = dict["工号"];
        (cell.contentView.viewWithTag(2) as! UILabel).text = dict["英文名"];
        (cell.contentView.viewWithTag(3) as! UILabel).text = dict["中文名"];
        (cell.contentView.viewWithTag(4) as! UILabel).text = dict["性别"];
        
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
