//
//  LoginViewController.swift
//  Sun
//
//  Created by huang chunlu on 16/2/21.
//  Copyright © 2016年 channelhuang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var _usernameTextField: UITextField!

    @IBOutlet weak var _passwordTextField: UITextField!
    
    
    @IBAction func _closeFirstResponder(sender: AnyObject) {
        _usernameTextField.resignFirstResponder();
        _passwordTextField.resignFirstResponder();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named:"denglu.png")?.imageWithRenderingMode(UIImageRenderingMode.Automatic);
        let selimage = UIImage(named:"denglu.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        self.tabBarItem.title = "登录";
        self.tabBarItem.image = image;
        self.tabBarItem.selectedImage = selimage;
    }
    
    @IBAction func login(sender: UIButton) {
        let username = _usernameTextField.text;
        let password = _passwordTextField.text;
        
        if(username=="" &&
            password==""){
                let myStoryBoard = self.storyboard;
                let anotherView:SystemNaviViewController = myStoryBoard?.instantiateViewControllerWithIdentifier("systemnavi") as! SystemNaviViewController;
                self.presentViewController(anotherView, animated: true, completion: nil)
        }else{
            //实例化警告视图
            let alertController=UIAlertController(title: "提示", message: "帐号或密码不正确", preferredStyle: UIAlertControllerStyle.Alert);
            //实例化动作对象
            let action=UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil);
            //添加动作对象
            alertController.addAction(action);
            //显示警告视图
            self.presentViewController(alertController, animated: true, completion: nil);
        }

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
